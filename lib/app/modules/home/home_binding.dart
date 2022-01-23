import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LocaisLojasController>(() => LocaisLojasController());
  }
}

