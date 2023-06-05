import 'package:api_repository/models/models.dart';

class User {
  User({
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
}
