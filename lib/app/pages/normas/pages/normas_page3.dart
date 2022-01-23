import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/normas/normas_controller.dart';
import 'package:renner_coatings/app/pages/normas/widgets/tile_nome_seta_normas.dart';

class ProductListNormas extends GetWidget<NormasController> {
  final nametittuloNorm = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(titleText: nametittuloNorm!, isButtonBack: true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: GetBuilder<NormasController>(builder: (controller) {
              return controller.normModelListProduct == null
                  ? Center(
                      child: controller.loading == true
                          ? CircularProgressIndicator()
                          : Text("Sem dados!"))
                  : ListView.builder(
                      itemCount: controller.normModelListProduct!.length,
                      itemBuilder: (context, index) {
                        return TileNomeSetaNormas(
                          texto:"${controller.normModelListProduct![index].productName}",
                          function: () => Get.toNamed("/produto_info", arguments: controller.normModelListProduct![index].productId.toString()),
                        );
                      });
            }),
          )
        ],
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
