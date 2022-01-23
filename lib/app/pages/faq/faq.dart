import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/faq/faq_controller.dart';
import 'package:renner_coatings/app/pages/faq/widgets/expansion_tile.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class FAQ extends GetWidget<FaqController> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(
        titleText: "FAQ",
        isButtonBack: true,
      ),
      body: Obx(() {
        List listFaq = [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text("faq_nao_encontrou_reposrta".tr, style: font14Bold),
                ),
                Material(
                  color: Colors.transparent,
                  child: Ink(
                    height: 24,
                    width: 100,
                    child: InkWell(
                      onTap: () => _panelController.open(),
                      child: Center(child: Text("faq_clique_aqui".tr, style: font14BoldRed)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 125),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                backgroundColor: Colors.white,
              ),
              onPressed: () async {
                final link = WhatsAppUnilink(
                    phoneNumber: "+55 41 3341-3400",
                    text:
                        "faq_texto_whats".tr);
                await launch("$link");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("faq_atend_whats".tr,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HexColor("909090"))),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/icons/icon_whatsapp.png",
                        fit: BoxFit.cover),
                  ),
                ],
              ),
            ),
          ),
        ];
        if (!controller.loading.value)
          listFaq.insertAll(
              0,
              controller.faqList.value.faqModelList!
                  .map((e) => expansionTileFAQ(
                      title: e.title!, answer: e.answer!, link: e.link))
                  .toList());
        return controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : SlidingUpPanel(
                body: Padding(
                  padding: EdgeInsets.only(right: 20, left: 20, top: 30),
                  child: ListView.separated(
                    itemCount: listFaq.length,
                    padding: EdgeInsets.only(bottom: 40),
                    separatorBuilder: (_, i) {
                      return SizedBox(height: 10);
                    },
                    itemBuilder: (_, i) {
                      return listFaq[i];
                    },
                  ),
                ),
                defaultPanelState: PanelState.CLOSED,
                minHeight: 0,
                maxHeight: MediaQuery.of(context).size.height * 0.6,
                controller: _panelController,
                panel: PanelUp(panelCloseFun: () => _panelController.close()),
              );
      }),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
