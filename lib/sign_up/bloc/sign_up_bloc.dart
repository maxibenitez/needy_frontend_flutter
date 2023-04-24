import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<SignUpNameChanged>(_onSignUpNameChanged);
    on<SignUpLastNameChanged>(_onSignUpLastNameChanged);
    on<SignUpEmailChanged>(_onSignUpEmailChanged);
    on<SignUpPasswordChanged>(_onSignUpPasswordChanged);
    on<SignUpAddressChanged>(_onSignUpAddressChanged);
    on<SignUpPhoneChanged>(_onSignUpPhoneChanged);
    on<SignUpBirthDateChanged>(_onSignUpBirthDateChanged);
    on<SignUpGenderChanged>(_onSignUpGenderChanged);
    on<SignUpIgAccountChanged>(_onSignUpIgAccountChanged);
    on<SignUpZoneChanged>(_onSignUpZoneChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<SignUpIdChanged>(_onSignUpIdChanged);
  }

  Future<void> _onSignUpNameChanged(
      SignUpNameChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(name: event.name));
  }

  Future<void> _onSignUpLastNameChanged(
      SignUpLastNameChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(lastName: event.lastName));
  }

  Future<void> _onSignUpEmailChanged(
      SignUpEmailChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onSignUpPasswordChanged(
      SignUpPasswordChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSignUpAddressChanged(
      SignUpAddressChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(address: event.address));
  }

  Future<void> _onSignUpPhoneChanged(
      SignUpPhoneChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(phone: event.phone));
  }

  void _onSignUpBirthDateChanged(
    SignUpBirthDateChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      birthDate: event.birthDate,
    ));
  }

  Future<void> _onSignUpGenderChanged(
      SignUpGenderChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(gender: event.gender));
  }

  Future<void> _onSignUpIgAccountChanged(
      SignUpIgAccountChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(igAccount: event.igAccount));
  }

  Future<void> _onSignUpZoneChanged(
      SignUpZoneChanged event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(zone: event.zone));
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    final date = state.birthDate;
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    try {
      final response = await http.post(
        Uri.parse('https://api/users/insert-user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'ci': state.id,
          'firstName': state.name,
          'lastName': state.lastName,
          'address': state.address,
          'zone': state.zone,
          'phone': state.phone,
          'gender': state.gender,
          'birthDate': formattedDate,
          'email': state.email,
          'password': state.password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        emit(state.copyWith(status: SignUpStatus.success));
      } else {
        emit(state.copyWith(status: SignUpStatus.error));
        throw Exception('Error al llamar a la API');
      }
    } catch (e) {
      emit(state.copyWith(status: SignUpStatus.error));
      throw Exception(e.toString());
    }
  }

  Future<void> _onSignUpIdChanged(
      SignUpIdChanged event, Emitter<SignUpState> emit) async {
    final id = int.parse(event.id);
    emit(state.copyWith(id: id));
  }
}
