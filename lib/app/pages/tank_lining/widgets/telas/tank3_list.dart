import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/tank_lining/tank_lining_controller.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/componentes/item_result_agentes.dart';
import 'package:renner_coatings/app/pages/tank_lining/widgets/telas/tank4_normas.dart';

class TankAgentesResult extends GetWidget<TankLiningController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TankLiningController>(builder: (controller) {
      return Scaffold(
        backgroundColor: HexColor("EFEFEF"),
        appBar:Appbar(titleText: "${controller.nametittulo!}", isButtonBack: true),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: controller.tankLiningCoatingsModel == null
                  ? Center(
                      child: controller.loading == true
                          ? CircularProgressIndicator()
                          : Text("Sem dados!"))
                  : ListView.builder(
                      itemCount: controller.tankLiningCoatingsModel!.length,
                      itemBuilder: (context, index) {
                        return ItemResultAgentes(
                          optIcon: controller
                              .tankLiningCoatingsModel![index].isRecommended,
                          texto:
                              "${controller.tankLiningCoatingsModel![index].nameTypecoating}",
                          function: () {
                            controller.getTankAgentsNormas(
                                idtanklining: "${controller.idtypecoating}",
                                idtypecoating: "${controller.tankLiningCoatingsModel![index].idTypecoating}");

                            //vai para a proxima pg co os argumentos
                            Get.toNamed("/tank_agentes_normas",
                              arguments: TankAgentesNormasArgs(
                                  nametittuloNormas:"${controller.nametittulo}",
                                  nameTypecoating:"${controller.tankLiningCoatingsModel![index].nameTypecoating}"),
                            );
                          },
                        );
                      }),
            )
          ],
        ),
        bottomNavigationBar: CustonNavigatorBar(),
      );
    });
  }
}
