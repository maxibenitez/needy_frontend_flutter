// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skill _$SkillFromJson(Map<String, dynamic> json) => Skill(
      id: json['id'] as int,
      name: json['name'] as String,
      selected: json['selected'] as bool? ?? false,
    );

Map<String, dynamic> _$SkillToJson(Skill instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'selected': instance.selected,
    };
