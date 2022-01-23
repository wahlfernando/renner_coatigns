import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/button_carousel.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_controller.dart';

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: GetBuilder<LocaisLojasController>(builder: (controller) {
        return Container(
          child: FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
            child: Row(
              children: <Widget>[
                BottonCarrousel(
                    texto: "fabricas".tr,
                    function: () async {
                      if(controller.mudaCorFab == true){
                        controller.getDados();
                        controller.mudaCorFab = false;
                      } else{
                        controller.getStoresByType("Fabrica");
                        controller.mudaCorDistr = false;
                        controller.mudaCorFab = true;
                        controller.mudaCorRepre = false;
                        controller.mudaCorReve = false;
                        controller.mudaCorFili = false;
                      }
                    },
                  color: controller.mudaCorFab!
                ),
                SizedBox(width: 10),
                BottonCarrousel(
                    texto: "distribuidores".tr,
                    function: () async {
                      if(controller.mudaCorDistr == true){
                        controller.getDados();
                        controller.mudaCorDistr = false;
                      } else{
                        controller.getStoresByType("Distribuidor");
                        controller.mudaCorDistr = true;
                        controller.mudaCorFab = false;
                        controller.mudaCorRepre = false;
                        controller.mudaCorReve = false;
                        controller.mudaCorFili = false;
                      }
                    },
                    color: controller.mudaCorDistr!
                ),
                SizedBox(width: 10),
                BottonCarrousel(
                    texto: "representantes".tr,
                    function: () async {
                      if(controller.mudaCorRepre == true){
                        controller.getDados();
                        controller.mudaCorRepre = false;
                      } else{
                        controller.getStoresByType("Representante");
                        controller.mudaCorRepre = true;
                        controller.mudaCorDistr = false;
                        controller.mudaCorFab = false;
                        controller.mudaCorReve = false;
                        controller.mudaCorFili = false;
                      }
                    },
                    color: controller.mudaCorRepre!
                ),
                SizedBox(width: 10),
                BottonCarrousel(
                    texto: "revendas".tr,
                    function: () async {
                      if(controller.mudaCorReve == true){
                        controller.getDados();
                        controller.mudaCorReve = false;
                      } else{
                        controller.getStoresByType("Vendedor");
                        controller.mudaCorReve = true;
                        controller.mudaCorDistr = false;
                        controller.mudaCorFab = false;
                        controller.mudaCorRepre = false;
                        controller.mudaCorFili = false;
                      }
                    },
                    color: controller.mudaCorReve!
                ),
                SizedBox(width: 10),
                BottonCarrousel(
                    texto: "filiais".tr,
                    function: () async {
                      if(controller.mudaCorFili == true){
                        controller.getDados();
                        controller.mudaCorFili = false;
                      } else{
                        controller.getStoresByType("Filial");
                        controller.mudaCorFili = true;
                        controller.mudaCorDistr = false;
                        controller.mudaCorFab = false;
                        controller.mudaCorRepre = false;
                        controller.mudaCorReve = false;
                      }
                    },
                    color: controller.mudaCorFili!
                ),
              ],
            ),
          ),
        );
      }),

    );
  }
}
