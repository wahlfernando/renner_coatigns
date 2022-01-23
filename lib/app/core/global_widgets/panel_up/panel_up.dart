import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/controller/panel_up_controller.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/text_form_field_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:get/get.dart';

class PanelUp extends StatelessWidget {
  final VoidCallback panelCloseFun;
  final bool isWhatsapp;
  const PanelUp({Key? key, required this.panelCloseFun, this.isWhatsapp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PanelUpController();
    controller.onInit();
    return SingleChildScrollView(
      child: Container(
        color: HexColor("EFEFEF"),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBar(
              leading: Container(),
              toolbarHeight: 40,
              automaticallyImplyLeading: true,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("tit_enviar_pergunta".tr, style: font14BoldRed),
              actions: [
                IconButton(
                  onPressed: panelCloseFun,
                  icon: Icon(Icons.cancel, size: 23, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFieldFormPanel(hintText: "env_perg_nome".tr, editingController: controller.controllerName, isEnable: false),
                  SizedBox(height: 15),
                  TextFieldFormPanel(hintText: "E-mail", editingController: controller.controllerEmail, isEnable: false),
                  SizedBox(height: 15),
                  TextFieldFormPanel(hintText: "env_perg_txt_pergunta".tr, editingController: controller.controllerQuestion, isBigText: true),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      controller.sendQuestion();
                      panelCloseFun();
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 35,
                      alignment: Alignment.center,
                      child: Text("env_perg_btn_enviar".tr, style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(HexColor('ED1C24')),
                    ),
                  ),
                  isWhatsapp
                      ? Column(
                          children: [
                            SizedBox(height: 20),
                            Text("env_perg_Ou".tr, style: font14RegularGrey),
                            SizedBox(height: 20),
                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () async {
                                final link = WhatsAppUnilink(phoneNumber: "+55 41 3341-3400", text: "Olá! Seja bem-vindo ao Canal de Atendimento Renner Coatings!");
                                await launch("$link");
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("env_perg_atend_whats".tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HexColor("909090"))),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset("assets/icons/icon_whatsapp.png", fit: BoxFit.cover),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}