
import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/product/product_model.dart';
import 'package:renner_coatings/app/data/repository/product/product_repository.dart';

class ProdutoInfoController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  ProductModel? produto;

  final String productId = Get.arguments;

  @override
  void onInit() {
    getProduct(productId);
    super.onInit();
  }

  bool isLoading = true;

  void getProduct(String productId) async {
    produto = await productRepository.getProduct(productId);
    produto == null ? isLoading = true : isLoading = false;
    update();
  }

  void downloadFile(String linkFile) async {



  }


}
