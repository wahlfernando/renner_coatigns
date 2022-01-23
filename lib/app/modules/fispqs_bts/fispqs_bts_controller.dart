import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/fispqs_bts/fispqs_bts_model.dart';
import 'package:renner_coatings/app/data/repository/fispqs_bts/fispqs_bts_repository.dart';

class FispqsBtsController extends GetxController {
  FispqsBtsRepository _fispqsBtsRepository = FispqsBtsRepository();
  final fispqsBtsList = FispqsBtsModelList().obs;
  final loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getFilesList();
  }

  void getFilesList() async {
    loading.value = true;
    fispqsBtsList.value = await _fispqsBtsRepository.getListFilesByProducts();
    loading.value = false;
  }
}
