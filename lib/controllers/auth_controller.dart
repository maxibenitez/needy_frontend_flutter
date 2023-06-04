import 'dart:convert';

import 'package:api_repository/api_repository.dart';

class AuthController {
  static Future<void> registerUser({
    required String ci,
    required String firstName,
    required String lastName,
    required String address,
    required String zone,
    required String phone,
    required String gender,
    required DateTime birthDate,
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiRepository().register(
        ci: ci,
        firstName: firstName,
        lastName: lastName,
        address: address,
        zone: zone,
        phone: phone,
        gender: gender,
        birthDate: birthDate,
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        print(request);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiRepository().login(
        email: email,
        password: password,
      );

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        print(request);
      }
    } catch (e) {
      print(e);
    }
  }

  // static Future<List<Answer>> addAnswer() async {
  //   try {
  //     final response = await AnswerRespository().addAnswer();

  //     if (response.statusCode == 200) {
  //       final request = jsonDecode(response.body);
  //       return buildList(request['results']);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return [];
  // }
  // static List<Answer> buildList(dynamic data) {
  //   List<Answer> answers = [];

  //   final bool validateData = data != null;

  //   if (validateData) {
  //     for (var item in data) {
  //       answers.add(Answer(
  //           item["type"]));
  //     }
  //   }

  //   return answers;
  // }
}

final authController = AuthController();
