import 'package:get/instance_manager.dart';
import 'package:renner_coatings/app/data/repository/segment/segment.dart';
import 'package:renner_coatings/app/modules/segmentos/segmentos_controller.dart';

class SegmentosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SegmentosController(Get.find()));
    Get.lazyPut(() => SegmentRepository());
  }
}
