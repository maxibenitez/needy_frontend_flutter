import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
        name,
        selected,
        id,
      ];
}
