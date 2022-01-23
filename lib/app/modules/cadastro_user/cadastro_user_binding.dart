import 'package:get/get.dart';
import 'cadastro_user_controller.dart';

class CadastroUserBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CadastroUserController>(() => CadastroUserController());
  }
}

