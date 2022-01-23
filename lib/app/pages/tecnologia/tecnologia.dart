import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/modules/tecnologia/tecnologia_controller.dart';
import 'package:renner_coatings/app/pages/tecnologia/widgets/tile_nome_seta.dart';

class TecnologiaList extends GetWidget<TecnologiaController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TecnologiaController>(builder: (controller) {
      return Scaffold(
        backgroundColor: HexColor("EFEFEF"),
        appBar: Appbar(titleText: "tit_tecnologia".tr, isButtonBack: true),
        body: controller.technologyModel == null
            ? Center(
                child: controller.loading == true
                    ? CircularProgressIndicator()
                    : Text("Sem dados!"))
            : Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 30, left: 30, top: 10),
                    child: SearchForm(),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (_, i) =>
                            Divider(height: 0, thickness: 1),
                        itemCount: controller.technologyModel!.length,
                        itemBuilder: (context, index) {
                          return TileNomeSeta(
                            texto:
                                "${controller.technologyModel![index].technology}",
                            function: () {
                              Get.toNamed("/produtos_nomes", arguments: [true, "${controller.technologyModel![index].technologyId}", "tecnologia"]);
                            }
                          );
                        }),
                  ),
                ],
              ),
        bottomNavigationBar: CustonNavigatorBar(),
      );
    });
  }
}
