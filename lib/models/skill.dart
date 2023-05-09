import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  const Skill({
    required this.name,
    this.selected = false,
  });
  final String name;

  final bool selected;

  Skill copyWith({
    String? name,
    bool? selected,
  }) {
    return Skill(
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [
        name,
        selected,
      ];
}
