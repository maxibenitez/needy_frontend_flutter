import 'package:equatable/equatable.dart';

part 'rating.g.dart';

class Rating extends Equatable {
  const Rating(
      {required this.id,
      required this.receiverID,
      required this.giverID,
      required this.stars,
      required this.needID,
      this.comment});
  final int id;
  final String receiverID;
  final String giverID;
  final double stars;
  final String needID;
  final String? comment;

  Rating copyWith({
    int? id,
    String? receiverID,
    String? giverID,
    double? stars,
    String? needID,
    String? comment,
  }) {
    return Rating(
      id: id ?? this.id,
      receiverID: receiverID ?? this.receiverID,
      giverID: giverID ?? this.giverID,
      stars: stars ?? this.stars,
      needID: needID ?? this.needID,
      comment: comment ?? this.comment,
    );
  }

  /// A serialized constructor
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  /// A serializer
  Map<String, dynamic> toJson() => _$RatingToJson(this);

  @override
  List<Object?> get props => [
        id,
        receiverID,
        giverID,
        stars,
        needID,
        comment,
      ];
}
