import 'package:equatable/equatable.dart';
import 'package:needy_frontend/models/models.dart';

class Need extends Equatable {
  const Need({
    required this.id,
    required this.requestor,
    this.appliers,
    this.accepetedApplier,
    required this.status,
    this.description,
    required this.creationDate,
    required this.needDate,
    required this.acceptedDate,
    required this.requestedSkill,
  });

  final int id;
  final User requestor;
  final List<User>? appliers;
  final User? accepetedApplier;
  final String status;
  final String? description;
  final DateTime creationDate;
  final DateTime needDate;
  final DateTime acceptedDate;
  final Skill requestedSkill;

  Need copyWith({
    int? id,
    User? requestor,
    List<User>? appliers,
    User? accepetedApplier,
    String? status,
    String? description,
    DateTime? creationDate,
    DateTime? needDate,
    DateTime? acceptedDate,
    Skill? requestedSkill,
  }) {
    return Need(
      id: id ?? this.id,
      requestor: requestor ?? this.requestor,
      appliers: appliers ?? this.appliers,
      accepetedApplier: accepetedApplier ?? this.accepetedApplier,
      status: status ?? this.status,
      description: description ?? this.description,
      creationDate: creationDate ?? this.creationDate,
      needDate: needDate ?? this.needDate,
      acceptedDate: acceptedDate ?? this.acceptedDate,
      requestedSkill: requestedSkill ?? this.requestedSkill,
    );
  }

  @override
  List<Object?> get props => [
        id,
        requestor,
        appliers,
        accepetedApplier,
        status,
        description,
        creationDate,
        needDate,
        acceptedDate,
        requestedSkill,
      ];
}
