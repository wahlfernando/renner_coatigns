import 'package:get/get.dart';
import 'tecnologia_controller.dart';

class TecnologiaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TecnologiaController>(() => TecnologiaController());
  }
}

