import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'font_family.dart';

class Appbar extends AppBar {
  final String titleText;
  final bool isButtonBack;
  final bool isListProduct;
  final BuildContext? context;
  final PanelController? panelController;

  Appbar({required this.titleText, this.context, this.panelController, this.isButtonBack = false, this.isListProduct = false})
      : super(
          centerTitle: true,
          title: Text(titleText.tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: kBlack, fontFamily: FontFamily.helveticaNeue)),
          actions: isListProduct
              ? [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context!,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  actionsPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(FontAwesomeIcons.solidTimesCircle, size: 18),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "band_disponibilidade".tr,
                                        style: font16Bold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  content: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      panelController!.open();
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text:
                                            "band_descricao".tr,
                                        style: font14Regular,
                                        children: [
                                          TextSpan(
                                            text: "band_clicando_aqui".tr,
                                            style: font14BoldRed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "band_se_preferir".tr,
                                          style: font12Regular,
                                          textAlign: TextAlign.justify,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    OutlinedButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () async {
                                        final link = WhatsAppUnilink(phoneNumber: "+55 41 3341-3400", text: "band_txt_whats".tr);
                                        await launch("$link");
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("band_via_whats".tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("909090"))),
                                          Container(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset("assets/icons/icon_whatsapp.png", fit: BoxFit.cover),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(Icons.help_outline, size: 20, color: kRed),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                    ],
                  )
                ]
              : [],
          backgroundColor: Colors.transparent,
          leading: isButtonBack
              ? TextButton(
                  child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black, size: 30),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(kGrey),
                  ),
                  onPressed: () => Get.back(),
                )
              : null,
          elevation: 0,
        );
}
