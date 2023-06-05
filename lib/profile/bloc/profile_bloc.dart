import 'dart:async';

import 'package:api_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      final skillsSuggested = [const Skill(id: 2, name: "carpinteria")];

      final skillsApplied = [const Skill(id: 2, name: "carpinteria")];

      final mySkills = [const Skill(id: 2, name: "carpinteria")];
      emit(state.copyWith(
        status: ProfileStatus.loaded,
        myNeeds: skillsSuggested,
        myApplies: skillsApplied,
        mySkills: mySkills,
      ));
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error));
    }
  }
}
