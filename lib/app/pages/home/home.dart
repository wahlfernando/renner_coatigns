import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/botton_home.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/home/home_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends GetWidget<HomeController> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {

    Future _refreshData() async {
      await Future.delayed(Duration(seconds: 2));
      controller.getMyUser();
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SlidingUpPanel(
          body: Stack(
            children: [
              ColorGradientScreen(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                        child: Center(
                          child: Image.asset(
                            'assets/images/logo_renner.png',
                            width: 197,
                            height: 51,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "ola".tr,
                            style: font18Bold,
                          ),
                          Obx(
                            () => Text(
                              controller.user.value.name == null
                                  ? ""
                                  : "${controller.user.value.name}",
                              style: font18BoldRed,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: font14Light,
                            children: [
                              TextSpan(
                                  text: "textoHome".tr, style: font16Regular),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ButtonHome(
                                  texto: "produtos".tr,
                                  function: () {
                                    Get.toNamed("/produtos");
                                  }),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                              flex: 1,
                              child: ButtonHome(
                                texto: "FISPQ's E BT's",
                                function: () {
                                  Get.toNamed("/fispqs_bts");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: ButtonHome(
                                  texto: "normas".tr,
                                  function: () {
                                    Get.toNamed("/normas");
                                  }),
                            ),
                            SizedBox(width: 30),
                            Expanded(
                                flex: 1,
                                child: ButtonHome(
                                    texto: "ass_tecnica".tr,
                                    function: () => Get.toNamed("/faq"))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 1,
                                child: ButtonHome(
                                    texto: "Tank Lining\nResistence List",
                                    function: () {
                                      Get.toNamed("/tank_lining");
                                    })),
                            SizedBox(width: 30),
                            Expanded(
                              flex: 1,
                              child: ButtonHome(
                                texto: "fale_conosco".tr,
                                function: () {
                                  _panelController.open();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height * 0.6,
          controller: _panelController,
          panel: PanelUp(
            panelCloseFun: () {
              _panelController.close();
            },
            isWhatsapp: true,
          ),
        ),
        bottomNavigationBar: CustonNavigatorBar(),
      ),
    );
  }
}
