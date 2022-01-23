import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/segment/business_unit_model.dart';
import 'package:renner_coatings/app/data/model/segment/business_units_model.dart';
import 'package:renner_coatings/app/data/repository/api_response.dart';

class SegmentRepository {
  String baseUrl = Settings.apiURL;

  Dio dio = Dio();

  Future<ApiResponse<BusinessUnit>> getSegments() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    try {
      var response = await dio.get("$baseUrl/v1/CategoriesProducts/segment", options: Options(headers: headers));
      if (response.statusCode == 200) {
        BusinessUnit businessUnit = BusinessUnit.fromJson(response.data);
        return ApiResponse.ok(result: businessUnit);
      }
      // return ApiResponse.error(msg: 'response.data');
      return ApiResponse.error(msg: 'Não foi possível obter dados dos segmentos.');
    } catch (error, stacktrace) {
      return ApiResponse.error(msg: 'Ocorreu um error ao obter dados dos segmentos');
    }
  }

  Future<ApiResponse<BusinessUnits>> getBusinessUnits() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    try {
      var response = await dio.get('${baseUrl}/v1/CategoriesProducts/businessUnit/', options: Options(headers: headers));

      if (response.statusCode == 200) {
        BusinessUnits businessUnits = BusinessUnits.fromJson(response.data);
        return ApiResponse.ok(result: businessUnits);
      }
      return ApiResponse.error(msg: 'Não foi possível obter dados das unidades de negócios.');
    } catch (error) {
      print('error: $error');
      return ApiResponse.error(msg: 'Ocorreu um erro ao obter dados das unidades de negócios.');
    }
  }
}
