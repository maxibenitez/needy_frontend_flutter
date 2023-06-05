import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:needy_frontend/models/models.dart';

class RatingController {
  Future<List<Rating>> getRatingsByUser({required String id}) async {
    try {
      final response = await ApiRepository().getRatingsByUser(id);

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Rating> ratings = [];

        //TODO: Chequear esto
        if (validateData) {
          for (var item in data) {
            ratings.add(Rating(
              id: item["id"],
              giverID: item["giverCI"],
              receiverID: item["receiverCI"],
              stars: item["stars"],
              needID: item["needId"],
              // comment: item["comment"],
            ));
          }
        }
        return ratings;
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<void> insertRating({
    required String receiverID,
  }) async {
    try {
      final response = await ApiRepository().insertRating(
        receiverID: receiverID,
      );

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        print(request);
      }
    } catch (e) {
      print(e);
    }
  }
}

final ratingController = RatingController();
