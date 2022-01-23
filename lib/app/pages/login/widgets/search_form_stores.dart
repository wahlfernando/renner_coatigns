import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_controller.dart';



class SearchFormStores extends GetWidget<LocaisLojasController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaisLojasController>(builder: (controller){
      return Container(
        height: 45,
        color: Colors.white,
        child: TextFormField(
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value){
            controller.mudaCorFab = false;
            controller.mudaCorDistr = false;
            controller.mudaCorRepre = false;
            controller.mudaCorReve = false;
            controller.mudaCorFili = false;

            if(controller.textController.text.isEmpty){
              controller.getDados();
            } else{
              controller.getStoresByName(controller.textController.text.trim());
            }
          },
          controller: controller.textController,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "digite_estabelecimento".tr,
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
                  controller.mudaCorFab = false;
                  controller.mudaCorDistr = false;
                  controller.mudaCorRepre = false;
                  controller.mudaCorReve = false;
                  controller.mudaCorFili = false;

                  if(controller.textController.text.isEmpty){
                    controller.getDados();
                  } else{
                    controller.getStoresByName(controller.textController.text.trim());
                  }
                }),
            prefixIcon: controller.textController.text.length > 0 ?
            IconButton(
                icon: Icon(Icons.close, color: HexColor('ACACAC')),
                onPressed: (){
                  controller.textController.clear();
                  controller.getDados();
                })
                : null,
            isDense: false,
          ),
        ),
      );
    });

  }
}
