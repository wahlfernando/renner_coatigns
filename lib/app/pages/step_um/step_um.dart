import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/modules/step_um/step_um_controller.dart';
import 'package:renner_coatings/app/pages/step_um/widgets/button_step.dart';
import 'package:renner_coatings/app/pages/step_um/widgets/fundo_imagem_top.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StepUm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepUmController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            ColorGradientScreen(),
            FundoImagemTop(
                heightTop: 50,
                height: 600,
                children: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(37, 0, 37, 60),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "HelveticaNeue",
                              fontWeight: FontWeight.w400,
                              color: kBlack),
                          children: [
                            TextSpan(
                                text:"stepTexto".tr),
                          ],
                        ),
                      ),
                    ),
                    ButtonStep(
                        texto: "portugues".tr,
                        function: () {
                          controller.getAtivoBR();
                          Get.updateLocale(Locale('pt', 'BR'));
                        },
                        active: controller.ativadoBR),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonStep(
                        texto: "ingles".tr,
                        function: () {
                          controller.getAtivoUS();
                          Get.updateLocale(Locale('en', 'US'));
                        },
                        active: controller.ativadoUS),
                    SizedBox(
                      height: 16,
                    ),
                    ButtonStep(
                        texto: "espanhol".tr,
                        function: () {
                          controller.getAtivoES();
                          Get.updateLocale(Locale('es', 'ES'));
                        },
                        active: controller.ativadoES),
                    SizedBox(
                      height: 100,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 300, height: 60),
                        child: ElevatedButton(
                          onPressed: () async {
                            Get.toNamed("/login");
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor("ED1C24"),
                            onPrimary: Colors.grey[900],
                            shadowColor: Colors.black54,
                            elevation: 2,
                          ),
                          child: Wrap(
                            alignment: WrapAlignment.end,
                            children: [
                              Text("avancar".tr,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: kWhite),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: 50,
                              ),
                              Icon(Icons.arrow_forward_ios_sharp,
                                  color: kWhite),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    });
  }
}
