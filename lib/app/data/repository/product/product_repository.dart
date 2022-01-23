import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/apiResponse/apiResposnse.dart';
import 'package:renner_coatings/app/core/global_widgets/lang_translate.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/product/product_model.dart';
import 'package:renner_coatings/app/data/model/product/product_name_model.dart';
import 'package:renner_coatings/app/data/model/product/product_name_segment_model.dart';

class ProductRepository {
  String baseUrl = Settings.apiURL;

  Future<ApiResponse<ProductNameSegmentListModel>> getProductsBySegment(String segmentId) async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    try {
      var response = await Dio().get('$baseUrl/v1/Products/segment/$segmentId', options: Options(headers: headers));

      if (response.statusCode == 200) {
        return ApiResponse.ok(result: ProductNameSegmentListModel.fromJson(response.data));
      }
      return ApiResponse.error(msg: response.data);
    } catch (e) {
      print('error: e');
      return ApiResponse.error(msg: 'Ocorreu algum erro ao buscar os produtos.');
    }
  }

  Future<ProductNameListModel> getProductsByApplication(String applicationId) async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/Products/application/$applicationId', options: Options(headers: headers));
      if (response.statusCode == 200) {
        return ProductNameListModel.fromJson(response.data);
      } else {
        return ProductNameListModel();
      }
    } catch (e) {
      return ProductNameListModel();
    }
  }

  Future<ProductNameListModel> getProductsByTechnology(String technologyId) async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/Products/technology/$technologyId', options: Options(headers: headers));
      if (response.statusCode == 200) {
        return ProductNameListModel.fromJson(response.data);
      } else {
        return ProductNameListModel();
      }
    } catch (e) {
      return ProductNameListModel();
    }
  }

  Future<ProductNameListModel> getProductsName() async {
    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/Products/name');
      if (response.statusCode == 200) {
        return ProductNameListModel.fromJson(response.data);
      } else {
        return ProductNameListModel();
      }
    } catch (e) {
      return ProductNameListModel();
    }
  }

  Future<ProductModel> getProduct(String productId) async {
    var lang = LangTranslate().myLang;

    var headers = {'lang': '${lang.index + 1}'};
    var response = await Dio().get('$baseUrl/v1/products/product/$productId', options: Options(headers: headers));
    return ProductModel.fromJson(response.data);
  }

  Future<ProductNameListModel> findProductsByName(String name) async {
    Response response;
    try {
      response = await Dio().get('$baseUrl/v1/FindProducts/name/$name');
      if (response.statusCode == 200) {
        return ProductNameListModel.fromJson(response.data);
      } else {
        return ProductNameListModel();
      }
    } catch (e) {
      return ProductNameListModel();
    }
  }
}
