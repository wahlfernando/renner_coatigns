import 'package:get/get.dart';
import 'tank_lining_controller.dart';

class TankLiningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TankLiningController>(() => TankLiningController());
  }
}

