import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/norm/norm_model.dart';
import 'package:renner_coatings/app/data/repository/norm/norm_repository.dart';

class NormasController extends GetxController {
  List<NormModel>? normModel;
  List<NormModel>? normModelList;
  List<NormModel>? normModelListProduct;

  String? businessUnitId = Get.arguments;

  final loading = true;
  NormRepository normRepository = NormRepository();

  @override
  void onInit() {
    getNormsIssuer();
    super.onInit();
  }

  void getNormsByProduct(String businessUnitId) async {
    loading == true;
    var result = await normRepository.getNormsByProduct(businessUnitId);
    normModelListProduct = result.normModelList;

    if (normModelListProduct == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

  void getNormsBylistNorm(String normIssuer) async {
    loading == true;
    var result =
        businessUnitId == null ? await normRepository.getNormsBylistNorm(normIssuer: normIssuer) : await normRepository.getNormsBylistNorm(businessUnitId: businessUnitId, normIssuer: normIssuer);
    normModelList = result.normModelList;

    if (normModelList == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

  void getNormsIssuer() async {
    print(businessUnitId);

    loading == true;
    var result = businessUnitId == null
        ? await normRepository.getNormsIssuer()
        : await normRepository.getNormsIssuer(businessUnitId: businessUnitId);
    normModel = result.normModelList;

    if (normModel == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
