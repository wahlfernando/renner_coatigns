import 'package:get/get.dart';
import 'aplicacao_controller.dart';

class AplicacaoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AplicacaoController>(() => AplicacaoController());
  }
}

