import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/fispqs_bts/fispqs_bts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FispqsBtsRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<FispqsBtsModelList> getListFilesByProducts() async {
    var response = await dio.get("$baseUrl/v1/FispqsBts/ListFispqsBts");

    return FispqsBtsModelList.fromJson(response.data);
  }
}
