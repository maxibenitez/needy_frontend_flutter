part of 'skills_bloc.dart';

enum SkillsStatus {
  initial,
  loading,
  loaded,
  error,
}

class SkillsState extends Equatable {
  const SkillsState({
    required this.status,
    required this.skills,
  });

  SkillsState.initial()
      : this(
          status: SkillsStatus.initial,
          skills: [],
        );

  final SkillsStatus status;
  final List<Skill> skills;

  SkillsState copyWith({
    SkillsStatus? status,
    List<Skill>? skills,
  }) {
    return SkillsState(
      status: status ?? this.status,
      skills: skills ?? this.skills,
    );
  }

  @override
  List<Object> get props => [
        status,
        skills,
      ];
}
