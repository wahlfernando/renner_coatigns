import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/controller/panel_up_controller.dart';

class PanelUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PanelUpController>(() => PanelUpController());
  }
}
