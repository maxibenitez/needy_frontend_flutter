import 'dart:async';
import 'dart:convert';

import 'package:api_repository/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
      emit(state.copyWith(status: SearchNeediesStatus.loaded));
      final Response response = await http.get(
        Uri.parse("https://localhost:7008/api/needs/get-needs"),
        headers: <String, String>{'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Need> needs = [];
        if (validateData) {
          for (var item in data) {
            needs.add(Need(
              id: item["id"],
              requestor: item["requestor"],
              appliers: item["appliers"],
              accepetedApplier: item["accepetedApplier"],
              creationDate: item["creationDate"],
              description: item["description"],
              needDate: item["needDate"],
              status: item["status"],
              acceptedDate: item["acceptedDate"],
              requestedSkill: item["requestedSkill"],
            ));
          }
        }
        emit(state.copyWith(
          status: SearchNeediesStatus.loaded,
          neediesSuggested: needs,
        ));
      }
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
      emit(state.copyWith(
        status: SearchNeediesStatus.loaded,
        neediesSuggested: state.neediesSuggested,
      ));
      return;
    }
    final neediesSuggested = state.neediesSuggested
        .where((element) => element.requestedSkill.name
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();

    emit(state.copyWith(neediesSuggested: neediesSuggested));
  }
}
