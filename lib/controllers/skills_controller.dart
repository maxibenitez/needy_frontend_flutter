import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:needy_frontend/models/models.dart';

class SkillsController {
  Future<List<Skill>> getSkills() async {
    try {
      final response = await ApiRepository().getSkills();

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Skill> skills = [];

        //TODO: Chequear esto
        if (validateData) {
          for (var item in data) {
            skills.add(Skill(
              id: item["id"],
              name: item["name"],
            ));
          }
        }
        return skills;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
