class Rating {
  Rating(
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
}
