import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/tank_lining/tank_lining_controller.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/componentes/item_seta_tankLining.dart';

class TankLiningArguments {
  final String inicio;
  final String fim;

  TankLiningArguments(this.inicio, this.fim);
}

class TankLiningListAgentes extends GetWidget<TankLiningController> {

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as TankLiningArguments;

    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(titleText: "TANK LINING RESISTANCE",isButtonBack: true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: GetBuilder<TankLiningController>(builder: (controller) {
              controller.getDados(args.inicio, args.fim);
              return controller.tankLiningModel == null
                  ? Center(
                      child: controller.loading == true
                          ? CircularProgressIndicator()
                          : Text("Sem dados!"))
                  : ListView.builder(
                      itemCount: controller.tankLiningModel!.length,
                      itemBuilder: (context, index) {
                        return ItemSetaTankLining(
                            texto: "${controller.tankLiningModel![index].nameProduct}",
                            function: () {
                              controller.nametittulo = controller.tankLiningModel![index].nameProduct;
                              controller.idtypecoating = controller.tankLiningModel![index].idTanklining;
                              controller.getTankAgentsResult("${controller.tankLiningModel![index].idTanklining}");

                              Get.toNamed("/tank_agentes_result");
                            });
                      });
            }),
          )
        ],
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
