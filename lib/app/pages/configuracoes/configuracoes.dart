import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/configuracoes/configuracoes_controller.dart';
import 'package:renner_coatings/app/core/global_widgets/item_seta.dart';
import 'package:renner_coatings/app/pages/step_um/step_um.dart';

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Appbar(
        titleText: "tit_configuracoes".tr,
        isButtonBack: true,
      ),
      body: Stack(
        children: [
          ColorGradientScreen(),
          SingleChildScrollView(
            child: GetBuilder<ConfiguracoesController>(builder: (controller) {
              controller.buscaIdioma();
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Get.toNamed("/alterar_idioma"),
                          child: Ink(
                            height: 30,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("alterar_idioma".tr, style: font18Bold),
                                Icon(Icons.arrow_forward_ios,
                                    color: kBlack, size: 18)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(controller.idioma),
                    SizedBox(
                      height: 10,
                    ),
                    ItemSeta(
                      divider: false,
                      texto: "txt_alterarSenha".tr,
                      function: () {
                        Get.toNamed("/alterar_senha");
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child:
                                Text("txt_exibirNotificacoes".tr, style: font18Bold)),
                        Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            value: controller.isSwitched,
                            onChanged: (value) {
                              controller.updateSwitched(value);
                            },
                            activeTrackColor: Colors.green,
                            activeColor: Colors.black12,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            //cria
                            onClickDialog() {
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
                                      "txt_texto_excluir_conta".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16, fontFamily: FontFamily.helveticaNeue),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                            child: Text("txt_texto_fechar".tr),
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
                                            child: Text("txt_texto_excluir_conta".tr),
                                            style: ElevatedButton.styleFrom(
                                              primary: kRed,
                                              onPrimary: kWhite,
                                              shadowColor: kGrey,
                                              elevation: 5,
                                            ),
                                            onPressed: () async{
                                              controller.apagarConta();
                                              Get.offAllNamed('/stepum');
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                            //chama
                            onClickDialog();
                          },
                          child: Ink(
                            height: 30,
                            color: Colors.transparent,
                            child: Text("txt_apagarConta".tr,
                                style: font18BoldRed),
                          ),
                        ),
                      ),
                    )
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
