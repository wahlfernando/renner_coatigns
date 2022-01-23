import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/modules/produtos_nomes/produtos_nomes_controller.dart';
import 'package:renner_coatings/app/pages/produtos/pages/nomes/widgets/tile_nome.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProdutosNomes extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdutosNomesController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: HexColor("EFEFEF"),
          appBar: Appbar(titleText: "tit_produto_nomes".tr, context: context, panelController: _panelController, isButtonBack: true, isListProduct: true),
          body: controller.productNameModel == null
              ? Center(child: CircularProgressIndicator())
              : SlidingUpPanel(
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                        child: TextFormField(
                          textInputAction: TextInputAction.search,
                          onFieldSubmitted: (value){
                            if (textController.text == null || textController.text.isEmpty) {
                              controller.getDados();
                            } else {
                              controller.findProductsByName(textController.text);
                            }
                          },
                          controller: textController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: "digite_produto".tr,
                            hintStyle: TextStyle(fontSize: 16, height: 0, fontFamily: "HelveticaNeue", color: HexColor('ACACAC')),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: HexColor('DEDEDE')),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              borderSide: BorderSide(color: HexColor('DEDEDE')),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.search, color: HexColor('ACACAC')),
                                onPressed: () {
                                  if (textController.text == null || textController.text.isEmpty) {
                                    controller.getDados();
                                  } else {
                                    controller.findProductsByName(textController.text);
                                  }
                                }),
                            prefixIcon: textController.text.length > 0 ?
                            IconButton(
                                icon: Icon(Icons.close, color: HexColor('ACACAC')),
                                onPressed: (){
                                  textController.clear();
                                  controller.getDados();
                                })
                                : null,
                            isDense: false,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (_, i) => Divider(height: 0, thickness: 1),
                            itemCount: controller.productNameModel!.length,
                            itemBuilder: (context, index) {
                              return TileNome(
                                product: controller.productNameModel![index],
                                function: () => Get.toNamed("/produto_info", arguments: controller.productNameModel![index].productId.toString()),
                              );
                            }),
                      ),
                    ],
                  ),
                  minHeight: 0,
                  maxHeight: MediaQuery.of(context).size.height * 0.55,
                  controller: _panelController,
                  panel: PanelUp(
                    panelCloseFun: () {
                      _panelController.close();
                    },
                  ),
                ),
          bottomNavigationBar: CustonNavigatorBar(),
        );
      },
    );
  }
}
