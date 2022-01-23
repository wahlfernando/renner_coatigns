import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/category/application_model.dart';
import 'package:renner_coatings/app/data/model/category/business_unit_model.dart';
import 'package:renner_coatings/app/data/model/category/segment_model.dart';

class CategoryRepository {
  String baseUrl = Settings.apiURL;

  Future<BusinessUnitListModel> getCategoryBusinessUnits() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};

    var response = await Dio().get('$baseUrl/v1/CategoriesProducts/businessUnit', options: Options(headers: headers));
    return BusinessUnitListModel.fromJson(response.data);
  }

  Future<SegmentListModel> getCategorySegments() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    var response = await Dio().get('$baseUrl/v1/CategoriesProducts/segment', options: Options(headers: headers));
    return SegmentListModel.fromJson(response.data);
  }

  Future<ApplicationListModel> getCategoryApplications() async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    var response = await Dio().get('$baseUrl/v1/CategoriesProducts/application', options: Options(headers: headers));
    return ApplicationListModel.fromJson(response.data);
  }

}
