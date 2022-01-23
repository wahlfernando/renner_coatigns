import 'package:get/get.dart';
import 'package:renner_coatings/app/core/apiResponse/apiResposnse.dart';
import 'package:renner_coatings/app/data/model/product/product_name_model.dart';
import 'package:renner_coatings/app/data/model/product/product_name_segment_model.dart';
import 'package:renner_coatings/app/data/repository/product/product_repository.dart';
import 'package:renner_coatings/app/data/repository/segment/segment.dart';

class ProdutosPorSegmentoController extends GetxController {
  ProductRepository productRepository;

  Map<String, dynamic> argumentRoute = Get.arguments;
  String? titleAppBar;

  final isSwitched = false.obs;
  final isLoading = true.obs;
  final isError = false.obs;

  final produtos = ProductNameSegmentListModel().obs;
  final produtosWithNorm = <ProductNameSegmentModel>[];

  ProdutosPorSegmentoController(this.productRepository, {this.titleAppBar});

  @override
  void onInit() {
    titleAppBar = argumentRoute['nome_produto'];

    getProducts();

    super.onInit();
  }

  getProducts() async {
    var segmentId = argumentRoute['segmento_id'];
    ApiResponse<ProductNameSegmentListModel> response = await productRepository.getProductsBySegment(segmentId);

    if (response.ok == true) {
      isError.value = false;
      produtos.value = response.result!;
      for (var item in produtos.value.productModelList!) {
        if (item.isNorm!) {
          produtosWithNorm.add(item);
        }
      }
    } else {
      isError.value = true;
    }
    isLoading.value = false;
  }

  updateSwitech(value) {
    isSwitched.value = value;
  }
}
