import 'package:equatable/equatable.dart';

class Need extends Equatable {
  const Need({
    required this.requestedSkillId,
    required this.description,
    required this.date,
  });
  final String description;
  final int requestedSkillId;

  final DateTime date;

  Need copyWith({
    String? description,
    DateTime? date,
    int? requestedSkillId,
  }) {
    return Need(
      description: description ?? this.description,
      date: date ?? this.date,
      requestedSkillId: requestedSkillId ?? this.requestedSkillId,
    );
  }

  @override
  List<Object?> get props => [
        description,
        date,
        requestedSkillId,
      ];
}
