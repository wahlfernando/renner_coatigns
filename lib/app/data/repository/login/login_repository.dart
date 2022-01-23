import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository{

  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<Map<String, dynamic>?> postLogin(String email, String password) async {
    Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _pref;


    var formData = FormData.fromMap({
      'email': "$email",
      'password': "$password",
    });

    var response = await dio.post('$baseUrl/v1/Auth/login', data: formData);

    prefs.setString("token", response.data["token"]);
    prefs.setString("expiration_token", response.data["expiration"]);


    if(response.statusCode == 200){
      return json.decode(response.toString());
    } else {
      print("Status Message: ${response.statusMessage}");
      return json.decode(response.toString());
    }
  }


}