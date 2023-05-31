import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/models/models.dart';

part 'search_needies_event.dart';
part 'search_needies_state.dart';

class SearchNeediesBloc extends Bloc<SearchNeediesEvent, SearchNeediesState> {
  SearchNeediesBloc() : super(const SearchNeediesState.initial()) {
    on<ViewNeediesEventStarted>(_onViewNeediesEventStarted);
    on<SearchNeedyChanged>(_onSearchNeedyChanged);
  }

  FutureOr<void> _onViewNeediesEventStarted(
    ViewNeediesEventStarted event,
    Emitter<SearchNeediesState> emit,
  ) async {
    emit(state.copyWith(status: SearchNeediesStatus.loading));
    try {
      // final skillsSuggested = await _skillsRepository.getSkillsSuggested();
      final skillsSuggested = [const Skill(id: 2, name: "carpinteria")];
      emit(state.copyWith(
        status: SearchNeediesStatus.loaded,
        skillsSuggested: skillsSuggested,
      ));
    } catch (e) {
      emit(state.copyWith(status: SearchNeediesStatus.error));
    }
  }

  FutureOr<void> _onSearchNeedyChanged(
    SearchNeedyChanged event,
    Emitter<SearchNeediesState> emit,
  ) async {
    final query = event.query;
    if (query.isEmpty) {
      final skillsSuggested = [const Skill(id: 2, name: "carpinteria")];
      emit(state.copyWith(
        status: SearchNeediesStatus.loaded,
        skillsSuggested: skillsSuggested,
      ));
      return;
    }
    final skillsSuggested = state.skillsSuggested
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(skillsSuggested: skillsSuggested));
  }
}
