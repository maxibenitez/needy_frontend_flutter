part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginPasswordObscured extends LoginEvent {
  const LoginPasswordObscured({
    required this.passwordObscured,
  });

  final bool passwordObscured;

  @override
  List<Object?> get props => [passwordObscured];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();

  @override
  List<Object?> get props => [];
}
