part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpNameChanged extends SignUpEvent {
  const SignUpNameChanged({required this.name});

  final String name;

  @override
  List<Object> get props => [name];
}

class SignUpLastNameChanged extends SignUpEvent {
  const SignUpLastNameChanged({required this.lastName});

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class SignUpAddressChanged extends SignUpEvent {
  const SignUpAddressChanged({required this.address});

  final String address;

  @override
  List<Object> get props => [address];
}

class SignUpPhoneChanged extends SignUpEvent {
  const SignUpPhoneChanged({required this.phone});

  final String phone;

  @override
  List<Object> get props => [phone];
}

class SignUpBirthDateChanged extends SignUpEvent {
  const SignUpBirthDateChanged({required this.birthDate});

  final DateTime birthDate;

  @override
  List<Object?> get props => [birthDate];
}

class SignUpGenderChanged extends SignUpEvent {
  const SignUpGenderChanged({required this.gender});

  final String gender;

  @override
  List<Object?> get props => [gender];
}

class SignUpIgAccountChanged extends SignUpEvent {
  const SignUpIgAccountChanged({required this.igAccount});

  final String igAccount;

  @override
  List<Object?> get props => [igAccount];
}

class SignUpZoneChanged extends SignUpEvent {
  const SignUpZoneChanged({required this.zone});

  final String zone;

  @override
  List<Object?> get props => [zone];
}

class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted();

  @override
  List<Object> get props => [];
}

class SignUpIdChanged extends SignUpEvent {
  const SignUpIdChanged({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
