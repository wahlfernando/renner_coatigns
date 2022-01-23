import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<UserModel> getMyUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    print(token);
    var headers = {
      "Authorization": "Bearer " + token,
    };

    var response = await dio.get("$baseUrl/v1/user/info", options: Options(headers: headers));

    UserModel user = UserModel.fromJson(response.data);
    return user;
  }

  void updateMyUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    var headers = {
      "Authorization": "Bearer " + token,
    };

    var jsona = json.encode(user.toJson());

    var response = await dio.post(
      "$baseUrl/v1/User/infoUpdate",
      options: Options(headers: headers),
      data: jsona,
    );
  }

  void deleteUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token").toString();
    print(token);
    var headers = {
      "Authorization": "Bearer " + token,
    };

    try {
      var response = await dio.delete(
          "$baseUrl/v1/User/account",
          options: Options(headers: headers)
      );

      print("StatusCode: ${response.statusCode}");
      // if (response.statusCode == 200) {
      //   prefs.setString("token", "");
      // } else {
      //   debugPrint("Não deu statusCode = 200");
      // }
    } catch (e) {
      print("Deu ruim");
      print(e);
    }


  }
}
