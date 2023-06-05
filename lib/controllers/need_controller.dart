import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:http/http.dart';
import 'package:needy_frontend/controllers/controllers.dart';
import 'package:needy_frontend/models/models.dart';

class NeedController {
  void _checkApiResponseFailure(Response response) {
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  //TODO: Chequear como es cuando es con objeto
  Future<List<Need>> getNeeds() async {
    try {
      final response = await ApiRepository().getNeeds();

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Need> needs = [];
        if (validateData) {
          for (var item in data) {
            needs.add(Need(
              id: item["id"],
              requestor: item["requestor"],
              appliers: item["appliers"],
              accepetedApplier: item["accepetedApplier"],
              creationDate: item["creationDate"],
              description: item["description"],
              needDate: item["needDate"],
              status: item["status"],
              acceptedDate: item["acceptedDate"],
              requestedSkill: item["requestedSkill"],
            ));
          }
        }
        return needs;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Need>> getNeedsBySkill({required int skillId}) async {
    try {
      final response = await ApiRepository().getNeedsBySkill(skillId: skillId);

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        List<Need> needs = [];
        if (validateData) {
          for (var item in data) {
            needs.add(Need(
              id: item["id"],
              requestor: item["requestor"],
              appliers: item["appliers"],
              accepetedApplier: item["accepetedApplier"],
              creationDate: item["creationDate"],
              description: item["description"],
              needDate: item["needDate"],
              status: item["status"],
              acceptedDate: item["acceptedDate"],
              requestedSkill: item["requestedSkill"],
            ));
          }
        }
        return needs;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<Need?> getNeedById({required int needId}) async {
    try {
      final response = await ApiRepository().getNeedById(needId: needId);

      if (response.statusCode == 200) {
        final request = jsonDecode(response.body);
        final data = request['results'];
        final bool validateData = data != null;

        if (validateData) {
          return Need(
            id: data["id"],
            requestor: data["requestor"],
            appliers: data["appliers"],
            accepetedApplier: data["accepetedApplier"],
            creationDate: data["creationDate"],
            description: data["description"],
            needDate: data["needDate"],
            status: data["status"],
            acceptedDate: data["acceptedDate"],
            requestedSkill: data["requestedSkill"],
          );
        }
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> insertNeed(
      {required int requestedSkillId,
      required String description,
      required DateTime needDate}) async {
    final response = await ApiRepository().insertNeed(
      requestedSkillId: requestedSkillId,
      description: description,
      needDate: needDate,
    );
    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  //TODO: Chequear que devuevle esto

  Future<void> updateNeed(
      {required int needId,
      required int requestedSkillId,
      required String description,
      required DateTime needDate}) async {
    final response = await ApiRepository().updateNeed(
      needId: needId,
      requestedSkillId: requestedSkillId,
      description: description,
      date: needDate,
    );

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  Future<void> deleteNeed({required int needId}) async {
    final response = await ApiRepository().deleteNeed(needId: needId);

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  Future<void> applyNeed({required int needId}) async {
    final response = await ApiRepository().applyNeed(needId: needId);

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  Future<void> unapplyNeed({required int needId}) async {
    final response = await ApiRepository().unapplyNeed(needId: needId);

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  Future<void> acceptApplier(
      {required int needId, required String applierCI}) async {
    final response = await ApiRepository()
        .acceptApplier(needId: needId, applierCI: applierCI);

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }

  Future<void> declineApplier(
      {required int needId, required String applierCI}) async {
    final response = await ApiRepository()
        .declineApplier(needId: needId, applierCI: applierCI);

    if (response.statusCode < 200 || response.statusCode >= 299) {
      throw ApiResponseFailure(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }
  }
}
