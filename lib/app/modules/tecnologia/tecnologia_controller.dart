import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/category/technology_model.dart';
import 'package:renner_coatings/app/data/repository/category/tecnologia/tecnologia_repository.dart';

class TecnologiaController extends GetxController {
  List<TechnologyModel>? technologyModel;

  final loading = true;
  TecnologiaRepository tecnologiaRepository = TecnologiaRepository();

  @override
  void onInit() {
    getDados();
    super.onInit();
  }


  void getDados() async {
    loading == true;
    var result = await tecnologiaRepository.getCategoryTechnologys();
    technologyModel = result.technologyListModel;

    if (technologyModel == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }




}
