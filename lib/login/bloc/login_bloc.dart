import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
    print(emailChanged);
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
      //TODO: Borrar esto
      emit(state.copyWith(status: LoginStatus.success));
      final body = {
        'email': state.email,
        'password': state.password,
      };
      final Response response = await http.post(
          Uri.parse("https://localhost:7008/api/auth/login"),
          headers: <String, String>{'Content-Type': 'application/json'},
          body: json.encode(body));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        emit(state.copyWith(status: LoginStatus.success));
      } else if (response.statusCode == 400) {
        final data = jsonDecode(response.body);
        final message = data['message'];
        print(message);
        emit(state.copyWith(status: LoginStatus.error));
        throw Exception(message);
      } else {
        emit(state.copyWith(status: LoginStatus.error));
        throw Exception('Error al llamar a la API');
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
