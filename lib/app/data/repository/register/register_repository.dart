import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';


class RegisterRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<String?> postRegistro(String name, String email, String password,
      bool privacyPolicy, bool termsUse) async {
    var formData = FormData.fromMap({
      'name': '$name',
      'email': '$email',
      'password': '$password',
      'privacy_policy': '$privacyPolicy',
      'terms_use': '$termsUse'
    });

    Response response =
        await dio.post('$baseUrl/v1/Register/register', data: formData);

    return response.statusMessage;
  }
}
