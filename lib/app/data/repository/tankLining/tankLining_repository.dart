import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/login/login_model.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_id_coatings_model.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_model.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_normas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TankLiningRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<TankLiningListModel> getTankLining(String inicio, String fim) async {
    Response response;

    try {
      response = await dio.get('$baseUrl/v1/TankLining/name/$inicio/$fim');

      if (response.statusCode == 200) {
        return TankLiningListModel.fromJson(response.data);
      } else {
        return TankLiningListModel();
      }
    } catch (e) {
      print("Deu ruim");
      return TankLiningListModel();
    }
  }

  Future<TankLiningIdCoatingsListModel> getCoatingsIdTankLining(String idTankling) async {
    Response response;

    try {
      response = await dio.get('$baseUrl/v1/TankLining/coatings/$idTankling');

      if (response.statusCode == 200) {
        return TankLiningIdCoatingsListModel.fromJson(response.data);
      } else {
        return TankLiningIdCoatingsListModel();
      }
    } catch (e) {
      print("Deu ruim");
      return TankLiningIdCoatingsListModel();
    }
  }

  Future<TankLiningNormasModel> getNormasTankLining(String idtanklining, String idtypecoating) async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};

    Response response;
    try {
      response = await dio.get('$baseUrl/v1/TankLining/coatings/$idtanklining/notes/$idtypecoating', options: Options(headers: headers));

      print(response.data);

      if (response.statusCode == 200) {
        return TankLiningNormasModel.fromJson(response.data);
      } else {
        return TankLiningNormasModel();
      }
    } catch (e) {
      print(e);
      return TankLiningNormasModel();
    }
  }
}
