import 'package:get/get.dart';
import 'locais_lojas_controller.dart';

class LocaisLojasBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<LocaisLojasController>(() => LocaisLojasController());
  }

}

