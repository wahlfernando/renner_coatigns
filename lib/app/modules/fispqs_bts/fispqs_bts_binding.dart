import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/fispqs_bts/fispqs_bts_controller.dart';

class FispqsBtsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FispqsBtsController>(() => FispqsBtsController());
  }
}
