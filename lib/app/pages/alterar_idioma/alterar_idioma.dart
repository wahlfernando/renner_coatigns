import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/configuracoes/configuracoes_controller.dart';

class AlterarIdioma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(
            child: Text(
          "tit_alterar_idioma".tr,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kBlack,
              fontFamily: FontFamily.helveticaNeue),
        )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          ColorGradientScreen(),
          SingleChildScrollView(
            child: GetBuilder<ConfiguracoesController>(builder: (controller) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Material(
                      color: Colors.transparent,
                      child: Ink(
                        height: 30,
                        child: InkWell(
                          onTap: () {
                            Get.updateLocale(Locale('pt', 'BR'));
                            controller.getAtivoBR();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text("portugues".tr, style: font18Bold),
                              ),
                              controller.ativadoBR
                                  ? Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: HexColor("009517"),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Material(
                      color: Colors.transparent,
                      child: Ink(
                        height: 30,
                        child: InkWell(
                          onTap: () {
                            Get.updateLocale(Locale('en', 'US'));
                            controller.getAtivoUS();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text("ingles".tr, style: font18Bold),
                              ),
                              controller.ativadoUS
                                  ? Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: HexColor("009517"),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Material(
                      color: Colors.transparent,
                      child: Ink(
                        height: 30,
                        child: InkWell(
                          onTap: () {
                            Get.updateLocale(Locale('es', 'ES'));
                            controller.getAtivoES();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text("espanhol".tr, style: font18Bold),
                              ),
                              controller.ativadoES
                                  ? Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: HexColor("009517"),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
