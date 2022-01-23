import 'package:get/get.dart';
import 'step_um_controller.dart';

class StepUmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StepUmController>(() => StepUmController());
  }
}

