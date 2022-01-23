import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/category/technology_model.dart';

class TecnologiaRepository {
  String baseUrl = Settings.apiURL;

  Future<TechnologyListModel> getCategoryTechnologys() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};

    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/CategoriesProducts/technology', options: Options(headers: headers));

      if (response.statusCode == 200) {
        return TechnologyListModel.fromJson(response.data);
      } else {
        return TechnologyListModel();
      }
    } catch (e) {
      return TechnologyListModel();
    }
  }
}
