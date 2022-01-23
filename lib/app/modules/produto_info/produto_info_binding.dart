import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/produto_info/produto_info_controller.dart';

class ProdutoInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProdutoInfoController());
  }
}
