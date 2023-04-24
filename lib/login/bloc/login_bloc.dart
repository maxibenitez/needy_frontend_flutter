import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needy_frontend/utils/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginPasswordObscured>(_onPasswordObscured);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onPasswordObscured(
      LoginPasswordObscured event, Emitter<LoginState> emit) async {
    final obscurePassword = event.passwordObscured;

    emit(state.copyWith(obscurePasswordText: obscurePassword));
  }

  Future<void> _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) async {
    final passwordChanged = event.password;
    emit(
      state.copyWith(
        password: passwordChanged,
        passwordValid: true,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> _onEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) async {
    final emailChanged = event.email;
    emit(
      state.copyWith(
        email: emailChanged,
        emailValid: true,
        status: LoginStatus.initial,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    await Future<void>.delayed(const Duration(seconds: 1));
    try {
      final emailValid = StringValidation.emailValidation.hasMatch(state.email);
      final passwordValid = state.password.length >= 6;

      if (emailValid && passwordValid) {
        // TODO: Add login logic
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(
          state.copyWith(
            status: LoginStatus.error,
            emailValid: emailValid,
            passwordValid: passwordValid,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
        ),
      );
    }
  }
}
