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
    required this.skillsSuggested,
  });

  const SearchNeediesState.initial()
      : this(
          status: SearchNeediesStatus.initial,
          skillsSuggested: const [],
        );

  final SearchNeediesStatus status;
  final List<Skill> skillsSuggested;

  SearchNeediesState copyWith({
    SearchNeediesStatus? status,
    List<Skill>? skillsSuggested,
  }) {
    return SearchNeediesState(
      status: status ?? this.status,
      skillsSuggested: skillsSuggested ?? this.skillsSuggested,
    );
  }

  @override
  List<Object?> get props => [
        status,
        skillsSuggested,
      ];
}
