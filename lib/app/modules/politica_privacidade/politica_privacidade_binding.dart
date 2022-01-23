import 'package:get/get.dart';
import 'politica_privacidade_controller.dart';

class PoliticaPrivacidadeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliticaPrivacidadeController>(() => PoliticaPrivacidadeController());
  }
}

