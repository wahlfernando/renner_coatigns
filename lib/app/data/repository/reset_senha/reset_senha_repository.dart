import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/reset_senha/reset_senha_model.dart';


class ResetSenhaRepository{

  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<ResetSenha> resetSenha(String email) async {
    var response = await dio.get('$baseUrl/v1/User/requestResetPassword/$email');

    if(response.statusCode == 200){
      return ResetSenha.fromJson(response.data);
    } else {
    return ResetSenha();
    }
  }


}