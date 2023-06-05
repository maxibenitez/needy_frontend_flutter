// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      id: json['id'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      zone: json['zone'] as String,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      skill: json['skill'] == null
          ? null
          : Skill.fromJson(json['skill'] as Map<String, dynamic>),
      avgRating: (json['avgRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'lastName': instance.lastName,
      'address': instance.address,
      'password': instance.password,
      'phone': instance.phone,
      'gender': instance.gender,
      'id': instance.id,
      'birthDate': instance.birthDate.toIso8601String(),
      'zone': instance.zone,
      'skill': instance.skill,
      'avgRating': instance.avgRating,
    };
