import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:needy_frontend/models/models.dart';

class UserController {
  Future<List<User>> getUsers() async {
    try {
      final response = await ApiRepository().getUsers();

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<User> users = [];
        if (validateData) {
          for (var item in data) {
            users.add(User(
              id: item["ci"],
              name: item["firstName"],
              lastName: item["lastName"],
              email: item["email"],
              phone: item["phone"],
              address: item["address"],
              birthDate: item["birthDate"],
              zone: item["zone"],
              avgRating: item["avgRating"],
              skill: item["skill"],
              // skills: item["skills"],
            ));
          }
        }
        return users;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<User>> getUsersBySkill({required String skillId}) async {
    try {
      final response = await ApiRepository().getUsersBySkill(skillId);

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<User> users = [];
        if (validateData) {
          for (var item in data) {
            users.add(User(
              id: item["ci"],
              name: item["firstName"],
              lastName: item["lastName"],
              email: item["email"],
              phone: item["phone"],
              address: item["address"],
              birthDate: item["birthDate"],
              zone: item["zone"],
              avgRating: item["avgRating"],
              skill: item["skill"],
              // skills: item["skills"],
            ));
          }
        }
        return users;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<User?> getUserById({required String userId}) async {
    try {
      final response = await ApiRepository().getUserById(userId);

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        final User user;
        if (validateData) {
          user = User(
            id: data["ci"],
            name: data["firstName"],
            lastName: data["lastName"],
            email: data["email"],
            phone: data["phone"],
            address: data["address"],
            birthDate: data["birthDate"],
            zone: data["zone"],
            avgRating: data["avgRating"],
            skill: data["skill"],
            // skills: data["skills"],
          );
          return user;
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //TODO: Chequear esto
  Future<void> insertUserSkill({
    required int skillId,
  }) async {
    try {
      final response = await ApiRepository().insertUserSkill(
        skillId: skillId,
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
