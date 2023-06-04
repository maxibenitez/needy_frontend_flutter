library user_repository;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiRepository {
  Future<http.Response> register({
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
    final body = {
      'ci': ci,
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'zone': zone,
      'phone': phone,
      'gender': gender,
      'birthDate': birthDate,
      'email': email,
      'password': password,
    };
    final Response response = await http.post(
        Uri.parse("https://localhost:7008/api/auth/register"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: json.encode(body));
    return response;
  }

  Future<http.Response> login({
    required String email,
    required String password,
  }) async {
    final body = {
      'email': email,
      'password': password,
    };
    final Response response = await http.post(
        Uri.parse("https://localhost:7008/api/auth/login"),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: json.encode(body));
    return response;
  }

  Future<http.Response> getUsers() async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/users/get-users"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getUsersBySkill(String skillId) async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/users/get-users-by-skill/$skillId"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getUserById(String userId) async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/users/get-user-by-ci"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> insertUserSkill({required int skillId}) async {
    final body = {
      'skillId': skillId,
    };
    final Response response = await http.post(
      Uri.parse("https://localhost:7008/api/users/insert-user-skill"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> getRatingsByUser(String userId) async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/ratings/get-ratings-by-user"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  //TODO: Preguntar a maxi como es el request body

  Future<http.Response> insertRating({required String receiverID}) async {
    final body = {
      'receiverID': receiverID,
    };
    final Response response = await http.post(
      Uri.parse("https://localhost:7008/api/ratings/insert-rating"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> getSkills() async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/skills/get-skills"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getNeeds() async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/needs/get-needs"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getNeedsBySkill({required int skillId}) async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/needs/get-needs-by-skill/$skillId"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> getNeedById({required int needId}) async {
    final Response response = await http.get(
      Uri.parse("https://localhost:7008/api/needs/get-need-by-id/$needId"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> insertNeed(
      {required int requestedSkillId,
      required String description,
      required DateTime needDate}) async {
    final body = {
      'requestedSkillId': requestedSkillId,
      'description': description,
      'needDate': needDate,
    };
    final Response response = await http.post(
      Uri.parse("https://localhost:7008/api/needs/insert-need"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> updateNeed(
      {required int needId,
      required String description,
      required DateTime date,
      required int requestedSkillId}) async {
    final body = {
      'needId': needId,
      'description': description,
      'date': date,
      'requestedSkillId': requestedSkillId,
    };

    final Response response = await http.put(
      Uri.parse('https://localhost:7008/api/needs/update-need'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
    return response;
  }

  Future<http.Response> deleteNeed({required int needId}) async {
    final Response response = await http.delete(
      Uri.parse("https://localhost:7008/api/needs/delete-need"),
      headers: <String, String>{'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> applyNeed({required int needId}) async {
    final body = {
      'needId': needId,
    };
    final Response response = await http.post(
      Uri.parse("https://localhost:7008/api/needs/apply-need"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> unapplyNeed({required int needId}) async {
    final body = {
      'needId': needId,
    };
    final Response response = await http.delete(
      Uri.parse("https://localhost:7008/api/needs/unapply-need"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    return response;
  }

  Future<http.Response> acceptApplier(
      {required int needId, required String applierCI}) async {
    final body = {
      'needId': needId,
      'applierCI': applierCI,
    };
    final Response response = await http.put(
      Uri.parse("https://localhost:7008/api/needs/accept-applier"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }

  Future<http.Response> declineApplier(
      {required int needId, required String applierCI}) async {
    final body = {
      'needId': needId,
      'applierCI': applierCI,
    };
    final Response response = await http.delete(
      Uri.parse("https://localhost:7008/api/needs/decline-applier"),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    return response;
  }
}
