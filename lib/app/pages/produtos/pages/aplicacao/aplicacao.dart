import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/modules/aplicacao/aplicacao_controller.dart';
import 'package:renner_coatings/app/pages/tecnologia/widgets/tile_nome_seta.dart';

class AplicacaoList extends GetWidget<AplicacaoController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AplicacaoController>(builder: (controller) {
      return Scaffold(
        backgroundColor: HexColor("EFEFEF"),
        appBar: Appbar(titleText: "tit_aplicacao".tr, isButtonBack: true),
        body: controller.applicationModel == null
            ? Center(child:CircularProgressIndicator())
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
                        itemCount: controller.applicationModel!.length,
                        itemBuilder: (context, index) {
                          return TileNomeSeta(
                            texto:
                                "${controller.applicationModel![index].application}",
                            function: () {
                              Get.toNamed("/produtos_nomes", arguments: [true, "${controller.applicationModel![index].applicationId}", "aplicacao"]);
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
