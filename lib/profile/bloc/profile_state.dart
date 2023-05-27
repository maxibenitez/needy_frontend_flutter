part of 'profile_bloc.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  const ProfileState({
    required this.status,
    required this.myNeeds,
    required this.myApplies,
    required this.mySkills,
  });

  const ProfileState.initial()
      : this(
          status: ProfileStatus.initial,
          myNeeds: const [],
          myApplies: const [],
          mySkills: const [],
        );

  final ProfileStatus status;
  final List<Skill> myNeeds;
  final List<Skill> myApplies;
  final List<Skill> mySkills;

  ProfileState copyWith({
    ProfileStatus? status,
    List<Skill>? myNeeds,
    List<Skill>? myApplies,
    List<Skill>? mySkills,
  }) {
    return ProfileState(
      status: status ?? this.status,
      myNeeds: myNeeds ?? this.myNeeds,
      myApplies: myApplies ?? this.myApplies,
      mySkills: mySkills ?? this.mySkills,
    );
  }

  @override
  List<Object> get props => [
        status,
        myNeeds,
        myApplies,
        mySkills,
      ];
}
