import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:needy_frontend/models/skill.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsState.initial()) {
    on<SkillSelected>(_onSkillSelected);
    on<GetSkills>(_onGetSkills);
  }

  Future<void> _onSkillSelected(
      SkillSelected event, Emitter<SkillsState> emit) async {
    final skillsListUpdated = state.skills
        .map((skill) => skill.name == event.skill.name
            ? event.skill.copyWith(selected: !event.skill.selected)
            : skill)
        .toList();

    emit(state.copyWith(skills: skillsListUpdated));
  }

  Future<void> _onGetSkills(GetSkills event, Emitter<SkillsState> emit) async {
    emit(state.copyWith(status: SkillsStatus.loading));
    try {
      final response = await http.get(
          Uri.parse("https://localhost:7008/api/skills/get-skills"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
          });

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final allSkills = buildList(request['results']);
        emit(state.copyWith(status: SkillsStatus.loaded, skills: allSkills));
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
}
