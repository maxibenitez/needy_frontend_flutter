part of 'view_needies_bloc.dart';

enum ViewNeediesStatus {
  initial,
  loading,
  loaded,
  error,
}

class ViewNeediesState extends Equatable {
  const ViewNeediesState({
    required this.status,
    required this.skillsSuggested,
  });

  const ViewNeediesState.initial()
      : this(
          status: ViewNeediesStatus.initial,
          skillsSuggested: const [],
        );

  final ViewNeediesStatus status;
  final List<Skill> skillsSuggested;

  ViewNeediesState copyWith({
    ViewNeediesStatus? status,
    List<Skill>? skillsSuggested,
  }) {
    return ViewNeediesState(
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
