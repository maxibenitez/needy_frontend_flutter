import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:needy_frontend/models/models.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({
    required this.name,
    required this.lastName,
    required this.address,
    required this.phone,
    required this.id,
    required this.birthDate,
    required this.zone,
    this.gender,
    this.email,
    this.password,
    this.skill,
    this.avgRating,
  });
  final String name;
  final String? email;
  final String lastName;
  final String address;
  final String? password;
  final String phone;
  final String? gender;
  final String id;
  final DateTime birthDate;
  final String zone;
  final Skill? skill;
  final double? avgRating;

  /// A serialized constructor
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// A serializer
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? name,
    String? lastName,
    String? address,
    String? phone,
    String? id,
    DateTime? birthDate,
    String? zone,
    String? gender,
    String? email,
    String? password,
    Skill? skill,
    double? avgRating,
  }) {
    return User(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      birthDate: birthDate ?? this.birthDate,
      zone: zone ?? this.zone,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      password: password ?? this.password,
      skill: skill ?? this.skill,
      avgRating: avgRating ?? this.avgRating,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lastName,
        address,
        phone,
        id,
        birthDate,
        zone,
        gender,
        email,
        password,
        skill,
        avgRating,
      ];
}
