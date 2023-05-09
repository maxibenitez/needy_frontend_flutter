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
          skills: [
            const Skill(name: "Cocina"),
            const Skill(name: "Limpieza"),
            const Skill(name: "Carpinteria"),
            const Skill(name: "Tecnología"),
            const Skill(name: "Pintura"),
            const Skill(name: "Cuidado de mascotas"),
            const Skill(name: "Flete"),
            const Skill(name: "Portería"),
            const Skill(name: "Jardinería"),
            const Skill(name: "Plomería"),
            const Skill(name: "Electricidad"),
            const Skill(name: "Guardería"),
            const Skill(name: "Fontanería"),
            const Skill(name: "Mecánico"),
          ],
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
