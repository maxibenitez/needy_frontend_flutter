part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  loaded,
  error,
  success,
}

enum UserProfileStatus {
  incomplete,
  complete,
}

class LoginState extends Equatable {
  const LoginState({
    required this.status,
    required this.password,
    required this.email,
    required this.obscurePasswordText,
    this.emailValid = true,
    this.passwordValid = true,
    this.errorMessage = '',
    this.userProfileStatus = UserProfileStatus.incomplete,
  });

  const LoginState.initial()
      : this(
          status: LoginStatus.initial,
          password: '',
          email: '',
          obscurePasswordText: true,
          userProfileStatus: UserProfileStatus.incomplete,
        );

  final LoginStatus status;
  final String password;
  final String email;
  final bool obscurePasswordText;
  final bool emailValid;
  final bool passwordValid;
  final String errorMessage;
  final UserProfileStatus userProfileStatus;

  LoginState copyWith({
    LoginStatus? status,
    bool? obscurePasswordText,
    String? password,
    String? email,
    bool? emailValid,
    bool? passwordValid,
    String? errorMessage,
    UserProfileStatus? userProfileStatus,
  }) {
    return LoginState(
      status: status ?? this.status,
      obscurePasswordText: obscurePasswordText ?? this.obscurePasswordText,
      password: password ?? this.password,
      email: email ?? this.email,
      emailValid: emailValid ?? this.emailValid,
      passwordValid: passwordValid ?? this.passwordValid,
      errorMessage: errorMessage ?? this.errorMessage,
      userProfileStatus: userProfileStatus ?? this.userProfileStatus,
    );
  }

  @override
  List<Object> get props => [
        status,
        obscurePasswordText,
        password,
        emailValid,
        email,
        passwordValid,
        errorMessage,
        userProfileStatus,
      ];
}
