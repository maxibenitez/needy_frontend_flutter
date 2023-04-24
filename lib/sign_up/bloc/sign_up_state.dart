part of 'sign_up_bloc.dart';

enum SignUpStatus {
  initial,
  loading,
  loaded,
  error,
  success,
}

class SignUpState extends Equatable {
  const SignUpState({
    required this.status,
    required this.name,
    required this.email,
    required this.lastName,
    required this.address,
    required this.password,
    required this.phone,
    required this.gender,
    required this.igAccount,
    required this.id,
    required this.birthDate,
    required this.zone,
  });

  SignUpState.initial()
      : this(
          status: SignUpStatus.initial,
          name: '',
          email: '',
          lastName: '',
          address: '',
          password: '',
          phone: '',
          gender: "Male",
          igAccount: '',
          id: 0,
          birthDate: DateTime.now(),
          zone: 'Lavalleja',
        );

  final SignUpStatus status;
  final String name;
  final String email;
  final String lastName;
  final String address;
  final String password;
  final String phone;
  final String gender;
  final String igAccount;
  final int id;
  final DateTime birthDate;
  final String zone;

  SignUpState copyWith({
    SignUpStatus? status,
    String? name,
    String? email,
    String? lastName,
    String? address,
    String? password,
    String? phone,
    String? gender,
    String? igAccount,
    int? id,
    DateTime? birthDate,
    String? zone,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      igAccount: igAccount ?? this.igAccount,
      id: id ?? this.id,
      birthDate: birthDate ?? this.birthDate,
      zone: zone ?? this.zone,
    );
  }

  @override
  List<Object?> get props => [
        status,
        name,
        email,
        lastName,
        address,
        password,
        phone,
        gender,
        igAccount,
        id,
        birthDate,
        zone,
      ];
}
