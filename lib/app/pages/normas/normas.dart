import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/normas/normas_controller.dart';
import 'package:renner_coatings/app/pages/normas/widgets/tile_nome_seta_normas.dart';

class NormasList extends GetWidget<NormasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(titleText: "tit_produto_normas".tr, isButtonBack: true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: GetBuilder<NormasController>(builder: (controller) {
              return controller.normModel == null
                  ? Center(
                      child: controller.loading == true
                          ? CircularProgressIndicator()
                          : Text("Sem dados!"))
                  : ListView.builder(
                      itemCount: controller.normModel!.length,
                      itemBuilder: (context, index) {
                        return TileNomeSetaNormas(
                            texto: "${controller.normModel![index].normIssuer}",
                            function: () {
                              controller.getNormsBylistNorm(
                                  "${controller.normModel![index].normIssuer}");

                              Get.toNamed("/normas_list_normas",
                                      arguments:
                                          "${controller.normModel![index].normIssuer}");
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
