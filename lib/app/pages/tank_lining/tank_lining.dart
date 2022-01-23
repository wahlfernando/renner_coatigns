import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/tank_lining/tank_lining_controller.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/componentes/item_seta_tank.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/telas/tank2_list.dart';

class TankLining extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TankLiningController>(
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Center(
                  child: Text(
                    "tnak_titulo".tr,
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
                 child: Padding(
                   padding: const EdgeInsets.all(30.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(height: 30),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                         child: Text("agentes_quimicos".tr, style: font18BoldRed,),
                       ),
                       ItemSetaTank(texto: "A - E", function: (){
                         Get.toNamed("/tankLiningList_agentes", arguments: TankLiningArguments("A", "E") );
                       }),
                       ItemSetaTank(texto: "F - J", function: (){
                         Get.toNamed("/tankLiningList_agentes", arguments: TankLiningArguments("F", "J") );
                       }),
                       ItemSetaTank(texto: "K - O", function: (){
                         Get.toNamed("/tankLiningList_agentes", arguments: TankLiningArguments("K", "O") );
                       }),
                       ItemSetaTank(texto: "P - T", function: (){
                         Get.toNamed("/tankLiningList_agentes", arguments: TankLiningArguments("P", "T") );
                       }),
                       ItemSetaTank(texto: "U - Z", function: (){
                         Get.toNamed("/tankLiningList_agentes", arguments: TankLiningArguments("U", "Z") );
                       })
                     ],
                   ),
                 ),
                )
              ],
            ),
            bottomNavigationBar: CustonNavigatorBar(),
          );
        }
    );
  }
}
