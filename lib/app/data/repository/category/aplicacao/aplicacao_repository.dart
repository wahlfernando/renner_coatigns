import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/category/application_model.dart';
import 'package:renner_coatings/app/data/model/category/technology_model.dart';

class AplicacaoRepository {
  String baseUrl = Settings.apiURL;


  Future<ApplicationListModel> getCategoryAplications() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};

    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/CategoriesProducts/application', options: Options(headers: headers));

      if (response.statusCode == 200) {
        return ApplicationListModel.fromJson(response.data);
      } else {
        return ApplicationListModel();
      }
    } catch (e) {
      return ApplicationListModel();
    }
  }
}
