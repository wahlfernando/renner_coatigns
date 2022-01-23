import 'package:get/get.dart';
import 'package:renner_coatings/app/data/repository/product/product_repository.dart';
import 'package:renner_coatings/app/modules/produtos_por_segmento/produtos_por_segmento_controller.dart';

class ProdutosPorSegmentoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductRepository());
    Get.lazyPut(() => ProdutosPorSegmentoController(Get.find()));
  }
}
