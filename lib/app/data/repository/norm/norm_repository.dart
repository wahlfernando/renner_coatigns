import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/norm/norm_model.dart';

class NormRepository {
  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<NormListModel> getNormsByBusinessUnit(String businessUnitId) async {
    var response = await Dio().get('$baseUrl/v1/Norm/businessUnit/$businessUnitId');
    return NormListModel.fromJson(response.data);
  }

  Future<NormListModel> getNormsByProduct(String normId) async {
    Response response;
    try {
      response = await dio.get('$baseUrl/v1/Norm/product/$normId');

      if (response.statusCode == 200) {
        return NormListModel.fromJson(response.data);
      } else {
        return NormListModel();
      }
    } catch (e) {
      print("Deu ruim");
      print(e);
      return NormListModel();
    }
  }

  Future<NormListModel> getNormsBylistNorm({String? businessUnitId, required String normIssuer}) async {
    Response response;
    var headers = {"businessUnitId": businessUnitId};

    try {
      businessUnitId == null
          ? response = await dio.get('$baseUrl/v1/Norm/listNorm/$normIssuer')
          : response = await dio.get('$baseUrl/v1/Norm/listNorm/$normIssuer', options: Options(headers: headers));

      if (response.statusCode == 200) {
        return NormListModel.fromJson(response.data);
      } else {
        return NormListModel();
      }
    } catch (e) {
      print("Deu ruim");
      return NormListModel();
    }
  }

  Future<NormListModel> getNormsIssuer({String? businessUnitId}) async {
    Response response;
    var headers = {"businessUnitId": businessUnitId};

    try {
      businessUnitId == null ? response = await dio.get('$baseUrl/v1/Norm/listNormIssuer') : response = await dio.get('$baseUrl/v1/Norm/listNormIssuer', options: Options(headers: headers));

      if (response.statusCode == 200) {
        return NormListModel.fromJson(response.data);
      } else {
        return NormListModel();
      }
    } catch (e) {
      print("Deu ruim");
      return NormListModel();
    }
  }
}
