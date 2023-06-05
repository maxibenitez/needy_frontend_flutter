import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:needy_frontend/models/skill.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsState.initial()) {
    on<SkillSelected>(_onSkillSelected);
    on<GetSkills>(_onGetSkills);
    on<ContinueSubmitted>(_onContinueSubmitted);
  }

  Future<void> _onSkillSelected(
      SkillSelected event, Emitter<SkillsState> emit) async {
    if (state.selectedSkill.length <= 1) {
      final skillsListUpdated = state.skills
          .map((skill) => skill.name == event.skill.name
              ? event.skill.copyWith(selected: !event.skill.selected)
              : skill)
          .toList();

      final skillsSelected = state.selectedSkill;
      skillsSelected.add(event.skill);

      emit(state.copyWith(
          skills: skillsListUpdated, selectedSkill: skillsSelected));
    } else {
      emit(state.copyWith(status: SkillsStatus.alreadyOneSkillSelected));
    }
  }

  Future<void> _onGetSkills(GetSkills event, Emitter<SkillsState> emit) async {
    emit(state.copyWith(status: SkillsStatus.loading));
    try {
      final Response response = await http.get(
        Uri.parse("https://localhost:7008/api/skills/get-skills"),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Skill> skills = [];

        //TODO: Chequear esto
        if (validateData) {
          for (var item in data) {
            skills.add(Skill(
              id: item["id"],
              name: item["name"],
            ));
          }
        }
        emit(state.copyWith(skills: skills, status: SkillsStatus.loaded));
      }
    } catch (e) {
      emit(state.copyWith(status: SkillsStatus.error));
      print(e);
    }
  }

  static List<Skill> buildList(dynamic data) {
    List<Skill> stories = [];

    final bool validateData = data != null;

    if (validateData) {
      for (var item in data) {
        stories.add(Skill(id: item["id"], name: item["name"]));
      }
    }

    return stories;
  }

  Future<void> _onContinueSubmitted(
      ContinueSubmitted event, Emitter<SkillsState> emit) async {
    emit(state.copyWith(status: SkillsStatus.loading));

    final body = {
      'skillId': state.selectedSkill[0].id,
    };
    final Response response = await http.post(
      Uri.parse("https://localhost:7008/api/users/insert-user-skill"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      emit(state.copyWith(status: SkillsStatus.loaded));
    } else {
      emit(state.copyWith(status: SkillsStatus.error));
    }
  }
}
