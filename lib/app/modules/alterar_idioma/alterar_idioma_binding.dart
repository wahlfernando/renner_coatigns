import 'package:get/get.dart';
import 'alterar_idioma_controller.dart';

class AlterarIdiomaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlterarIdiomaController>(() => AlterarIdiomaController());
  }
}

