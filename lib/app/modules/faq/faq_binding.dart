import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/faq/faq_controller.dart';

class FaqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController());
  }
}
