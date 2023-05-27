import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/models/models.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState.initial()) {
    on<MyProfileStarted>(_onMyProfileStarted);
  }

  Future<void> _onMyProfileStarted(
      MyProfileStarted event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      // final skillsSuggested = await _skillsRepository.getSkillsSuggested();
      final skillsSuggested = [
        const Skill(name: "Cocina"),
        const Skill(name: "Limpieza"),
      ];

      final skillsApplied = [
        const Skill(name: "Cocina"),
        const Skill(name: "Limpieza"),
      ];

      final mySkills = [
        const Skill(name: "Cocina"),
        const Skill(name: "Limpieza"),
      ];
      emit(state.copyWith(
        status: ProfileStatus.loaded,
        myNeeds: skillsSuggested,
        myApplies: skillsApplied,
      ));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
