import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/produtos_nomes/produtos_nomes_controller.dart';

class ProdutosNomesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutosNomesController>(() => ProdutosNomesController());
  }
}
