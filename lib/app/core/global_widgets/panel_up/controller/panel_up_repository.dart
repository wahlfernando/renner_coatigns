import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';

class PanelUpRepository {
  String baseUrl = Settings.apiURL;

  Future<List> sendQuestion({required String name, required String email, required String question}) async {
    Response response;
    try {
      var body = {"name": name, "email": email, "question": question};
      response = await Dio().post('$baseUrl/v1/ContactUs', data: body);

      if (response.statusCode == 200) {
        return [response.statusCode, response.data];
      } else {
        return [response.statusCode, "Não foi possivel enviar a pergunta, tente novamente mais tarde."];
      }
    } catch (e) {
      return ["Erro", "Erro"];
    }
  }
}
