part of 'skills_bloc.dart';

enum SkillsStatus {
  initial,
  loading,
  loaded,
  error,
  alreadyOneSkillSelected,
}

class SkillsState extends Equatable {
  const SkillsState({
    required this.status,
    required this.skills,
    required this.selectedSkill,
  });

  SkillsState.initial()
      : this(
          status: SkillsStatus.initial,
          skills: [],
          selectedSkill: [],
        );

  final SkillsStatus status;
  final List<Skill> skills;
  final List<Skill> selectedSkill;

  SkillsState copyWith({
    SkillsStatus? status,
    List<Skill>? skills,
    List<Skill>? selectedSkill,
  }) {
    return SkillsState(
      status: status ?? this.status,
      skills: skills ?? this.skills,
      selectedSkill: selectedSkill ?? this.selectedSkill,
    );
  }

  @override
  List<Object> get props => [
        status,
        skills,
        selectedSkill,
      ];
}
