import 'package:dio/dio.dart';
import 'package:renner_coatings/app/core/settings/settings.dart';
import 'package:renner_coatings/app/data/model/locais_lojas/locais_lojas_model.dart';


class LocaislojasRepository{

  String baseUrl = Settings.apiURL;
  Dio dio = Dio();

  Future<LocaisLojasListModel> getStores() async {
    Response response;

    try {
      response = await dio.get('$baseUrl/v1/StoresLocation/stores');

      if (response.statusCode == 200) {
        return LocaisLojasListModel.fromJson(response.data);
      } else {
        return LocaisLojasListModel();
      }
    } catch (e) {
      print("Deu ruim");
      return LocaisLojasListModel();
    }
  }

  Future<LocaisLojasListModel> getStoresByType(String tipo) async {
    Response response;

    try {
      response = await dio.get('$baseUrl/v1/StoresLocation/StoresByType/$tipo');

      if (response.statusCode == 200) {
        return LocaisLojasListModel.fromJson(response.data);
      } else {
        return LocaisLojasListModel();
      }
    } catch (e) {
      print(e);
      print("Deu ruim");
      return LocaisLojasListModel();
    }
  }

  Future<LocaisLojasListModel> getStoresByName(String name) async {
    Response response;

    try {
      response = await dio.get('$baseUrl/v1/StoresLocation/findName/$name');

      if (response.statusCode == 200) {
        return LocaisLojasListModel.fromJson(response.data);
      } else {
        return LocaisLojasListModel();
      }
    } catch (e) {
      print(e);
      print("Deu ruim");
      return LocaisLojasListModel();
    }
  }


}