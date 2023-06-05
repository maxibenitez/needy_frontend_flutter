import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'skill.g.dart';

@JsonSerializable()
class Skill extends Equatable {
  const Skill({
    required this.id,
    required this.name,
    this.selected = false,
  });
  final String name;
  final int id;

  final bool selected;

  Skill copyWith({
    String? name,
    bool? selected,
    int? id,
  }) {
    return Skill(
      name: name ?? this.name,
      selected: selected ?? this.selected,
      id: id ?? this.id,
    );
  }

  /// A serialized constructor
  factory Skill.fromJson(Map<String, dynamic> json) => _$SkillFromJson(json);

  /// A serializer
  Map<String, dynamic> toJson() => _$SkillToJson(this);

  @override
  List<Object?> get props => [
        name,
        selected,
        id,
      ];
}
