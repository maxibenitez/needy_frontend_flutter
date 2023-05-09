part of 'skills_bloc.dart';

abstract class SkillsEvent extends Equatable {
  const SkillsEvent();
}

class SkillSelected extends SkillsEvent {
  const SkillSelected({required this.skill});

  final Skill skill;

  @override
  List<Object?> get props => [skill];
}
