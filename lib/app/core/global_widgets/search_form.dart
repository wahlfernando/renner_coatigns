import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/modules/produtos_nomes/produtos_nomes_controller.dart';
import 'package:renner_coatings/app/routes/app_pages.dart';

import 'hexcolor.dart';

class SearchForm extends GetWidget<ProdutosNomesController> {

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: 45,
      color: Colors.white,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value){
          if(textController.text.isEmpty){
            Get.toNamed("/produtos_nomes", arguments: [false]);
            textController.clear();
          } else{
            Get.toNamed("/produtos_nomes", arguments: [true, textController.text ,"find_products"]);
            textController.clear();
          }
        },
        controller: textController,
        maxLines: 1,
        decoration: InputDecoration(
          hintText: "digite_produto".tr,
          hintStyle: TextStyle(
              fontSize: 16,
              height: 0,
              fontFamily: "HelveticaNeue",
              color: HexColor('ACACAC')),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: HexColor('DEDEDE')),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: HexColor('DEDEDE')),
          ),
          suffixIcon: IconButton(
              icon: Icon(Icons.search, color: HexColor('ACACAC')),
              onPressed: (){
                if(textController.text.isEmpty){
                  Get.toNamed("/produtos_nomes", arguments: [false]);
                  textController.clear();
                } else{
                  Get.toNamed("/produtos_nomes", arguments: [true, textController.text ,"find_products"]);
                  textController.clear();
                }
              }),
          prefixIcon: textController.text.length > 0 ?
          IconButton(
              icon: Icon(Icons.close, color: HexColor('ACACAC')),
              onPressed: (){
                textController.clear();
                Get.toNamed("/produtos_nomes", arguments: [false]);
              })
              : null,
          isDense: false,
        ),
      ),
    );
  }
}
