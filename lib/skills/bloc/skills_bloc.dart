import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/models/skill.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsState.initial()) {
    on<SkillSelected>(_onSkillSelected);
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
}
