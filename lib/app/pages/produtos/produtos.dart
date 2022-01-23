import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/pages/produtos/widgets/button_produto.dart';

class ProdutosHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbar(titleText: "tit_produtos".tr, isButtonBack: true,),
      body: Stack(
        children: [
          ColorGradientScreen(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                SearchForm(),
                SizedBox(height: 30),
                Text(
                  "text_busca_base".tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: HexColor('58585A'),
                      fontFamily: "HelveticaNeue"),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonProduto(
                        text: 'prod_nomes'.tr,
                        onPressed: () =>
                            Get.toNamed("/produtos_nomes", arguments: [false])),
                    SizedBox(width: 20),
                    ButtonProduto(
                        text: 'prod_tecnologia'.tr,
                        onPressed: () {
                          Get.toNamed("/tecnologia");
                        }),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonProduto(
                        text: 'prod_aplicacao'.tr,
                        onPressed: () {
                          Get.toNamed("/aplicacao");
                        }),
                    SizedBox(width: 20),
                    ButtonProduto(
                        text: 'prod_segmentos'.tr,
                        onPressed: () {
                          Get.toNamed('/segmentos');
                        }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
