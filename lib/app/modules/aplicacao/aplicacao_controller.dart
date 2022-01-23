import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/category/application_model.dart';
import 'package:renner_coatings/app/data/model/category/technology_model.dart';
import 'package:renner_coatings/app/data/repository/category/aplicacao/aplicacao_repository.dart';
import 'package:renner_coatings/app/data/repository/category/tecnologia/tecnologia_repository.dart';

class AplicacaoController extends GetxController {
  List<ApplicationModel>? applicationModel;

  final loading = true;
  AplicacaoRepository aplicacaoRepository = AplicacaoRepository();

  @override
  void onInit() {
    getDados();
    super.onInit();
  }

  void getDados() async {
    loading == true;
    var result = await aplicacaoRepository.getCategoryAplications();
    applicationModel = result.applicationListModel;

    if (applicationModel == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

}
