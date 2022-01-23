import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/home/home_controller.dart';
import 'package:renner_coatings/app/modules/meus_dados/meus_dados_controller.dart';

class MeusDadosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MeusDadosController>(() => MeusDadosController());
  }
}
