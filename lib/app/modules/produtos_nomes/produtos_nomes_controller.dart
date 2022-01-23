import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/product/product_name_model.dart';
import 'package:renner_coatings/app/data/repository/product/product_repository.dart';

class ProdutosNomesController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  List<ProductNameModel>? productNameModel;
  final argumentosC = Get.arguments;
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    argumentosC[0] == false
        ? getDados()
        : argumentosC[2] == "tecnologia"
            ? getProductsByTechnology(argumentosC[1])
            : argumentosC[2] == "find_products"
                ? findProductsByName(argumentosC[1])
                : getProductsByApplication(argumentosC[1]);
    super.onInit();
  }

  void buscaProdutos(){
    if(textController.text == null || textController.text.isEmpty){
      getDados();
    } else {
      findProductsByName(
          textController.text);
    }
  }

  void getDados() async {
    var result = await productRepository.getProductsName();
    productNameModel = result.productModelList;
    update();
  }

  void getProductsByTechnology(String technologyId) async {
    var result = await productRepository.getProductsByTechnology(technologyId);
    productNameModel = result.productModelList;
    update();
  }

  void findProductsByName(String name) async {
    var result = await productRepository.findProductsByName(name);
    productNameModel = result.productModelList;
    update();
  }

  void getProductsByApplication(String applicationId) async {
    var result =
        await productRepository.getProductsByApplication(applicationId);
    productNameModel = result.productModelList;
    update();
  }

  @override
  void dispose() {
    ProductNameModel.fromJson({});
    getDados();
    getProductsByTechnology("1");
    getProductsByApplication("1");
    super.dispose();
  }
}
