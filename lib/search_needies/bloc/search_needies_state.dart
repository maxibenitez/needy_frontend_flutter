part of 'search_needies_bloc.dart';

enum SearchNeediesStatus {
  initial,
  loading,
  loaded,
  error,
}

class SearchNeediesState extends Equatable {
  const SearchNeediesState({
    required this.status,
    required this.neediesSuggested,
  });

  const SearchNeediesState.initial()
      : this(
          status: SearchNeediesStatus.initial,
          neediesSuggested: const [],
        );

  final SearchNeediesStatus status;
  final List<Need> neediesSuggested;

  SearchNeediesState copyWith({
    SearchNeediesStatus? status,
    List<Need>? neediesSuggested,
  }) {
    return SearchNeediesState(
      status: status ?? this.status,
      neediesSuggested: neediesSuggested ?? this.neediesSuggested,
    );
  }

  @override
  List<Object?> get props => [
        status,
        neediesSuggested,
      ];
}
