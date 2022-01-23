import 'package:get/get.dart';
import 'normas_controller.dart';

class NormasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NormasController>(() => NormasController());
  }
}

