import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/home/home_controller.dart';
import 'configuracoes_controller.dart';

class ConfiguracoesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConfiguracoesController>(() => ConfiguracoesController());
  }
}

