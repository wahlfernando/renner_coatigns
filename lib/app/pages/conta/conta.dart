import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/core/global_widgets/item_seta.dart';
import 'package:renner_coatings/app/pages/step_um/step_um.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Conta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _onClickDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            title: Center(
              child: FaIcon(
                FontAwesomeIcons.exclamationCircle,
                size: 50,
                color: kRed,
              ),
            ),
            content: Text(
              "txt_texto_sair_app".tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontFamily: FontFamily.helveticaNeue),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    child: Text("conta_fechar".tr),
                    style: ElevatedButton.styleFrom(
                      primary: kRed,
                      onPrimary: kWhite,
                      shadowColor: kGrey,
                      elevation: 5,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  ElevatedButton(
                    child: Text("conta_sair_conta".tr),
                    style: ElevatedButton.styleFrom(
                      primary: kRed,
                      onPrimary: kWhite,
                      shadowColor: kGrey,
                      elevation: 5,
                    ),
                    onPressed: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();

                      prefs.setString("token", "");

                      Get.offAllNamed('/login');
                    },
                  ),
                ],
              )
            ],
          );
        },
      );
    }
    return Scaffold(
      appBar: Appbar(
        titleText: "tti_conta".tr,
        isButtonBack: true,
      ),
      body: Stack(
        children: [
          ColorGradientScreen(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  ItemSeta(
                    divider: false,
                    texto: "conta_meusDados".tr,
                    function: () {
                      Get.toNamed("/meus_dados");
                    },
                  ),
                  ItemSeta(
                    divider: false,
                    texto: "conta_configuracoes".tr,
                    function: () {
                      Get.toNamed("/configuracoes");
                    },
                  ),
                  ItemSeta(
                    divider: false,
                    texto: "conta_sobre".tr,
                    function: () {
                      Get.toNamed("/sobre_app");
                    },
                  ),
                  ItemSeta(
                    divider: false,
                    texto: "conta_temosUso".tr,
                    function: () {
                      Get.toNamed("/termos_uso");
                    },
                  ),
                  ItemSeta(
                    divider: false,
                    texto: "conta_politicaPrivacidade".tr,
                    function: () {
                      Get.toNamed("/politica_privacidade", arguments: false);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Ink(
                      height: 30,
                      width: 80,
                      child: InkWell(
                        onTap: () async {
                          _onClickDialog();
                        },
                        child: Ink(
                            child: Text("conta_sair".tr, style: font18Bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
