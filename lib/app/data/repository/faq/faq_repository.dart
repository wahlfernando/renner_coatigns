import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/faq/faq_model.dart';
import 'package:get/get.dart';

class FaqRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<FaqModelList> getListFaq() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};

    var response = await dio.get("$baseUrl/v1/Faq/ListFaq", options: Options(headers: headers));
    if (response.statusCode == 200) {
      FaqModelList faqModelList = FaqModelList.fromJson(response.data);
      return faqModelList;
    } else {
      return FaqModelList();
    }
  }
}
