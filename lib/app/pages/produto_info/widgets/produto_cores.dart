import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:get/get.dart';

class ProdutoCores extends StatefulWidget {
  const ProdutoCores({Key? key}) : super(key: key);

  @override
  _ProdutoCoresState createState() => _ProdutoCoresState();
}

class _ProdutoCoresState extends State<ProdutoCores> {
  PanelController _panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _panelController.open(),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "prod_cores_txt".tr,
                    style: font14Regular,
                    children: [TextSpan(text: "band_clicando_aqui".tr, style: font14BoldRed)],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text("band_se_preferir".tr, style: font14RegularGrey),
            SizedBox(height: 10),
            TextButton(
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
        ),
      ),
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height * 0.53,
      controller: _panelController,
      panel: PanelUp(panelCloseFun: () {
        setState(() {
          _panelController.close();
        });
      }),
    );
  }
}
