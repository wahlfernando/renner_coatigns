import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/data/model/product/product_name_segment_model.dart';
import 'package:renner_coatings/app/modules/produtos_por_segmento/produtos_por_segmento_controller.dart';
import 'package:renner_coatings/app/pages/produtos_por_segmento/widgets/tile_nome_segment.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProdutosPorSegmentoPage extends GetWidget<ProdutosPorSegmentoController> {
  final PanelController _panelController = PanelController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(titleText: controller.titleAppBar!, context: context, panelController: _panelController, isButtonBack: true, isListProduct: true),
      body: SlidingUpPanel(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: HexColor("EFEFEF"),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(125),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      child: TabBar(
                        labelColor: kRed,
                        labelStyle: font16RegularRed,
                        unselectedLabelStyle: font16Regular,
                        unselectedLabelColor: Colors.black,
                        indicatorColor: kRed,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 1,
                        labelPadding: EdgeInsets.only(bottom: 5),
                        tabs: [
                          Text("txt_prod_segmento_tab_info".tr),
                          Text("txt_prod_segmento_tab_produtos".tr),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Image.network(
                        'https://s2.glbimg.com/g0hINlcGvoo1gc-NlqpkPx2NUsA=/940x523/e.glbimg.com/og/ed/f/original/2018/06/19/architecture-buildings-factory-247763.jpg',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('txt_prod_segmento_geral'.tr)
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  value: controller.isSwitched.value,
                                  onChanged: (value) {
                                    controller.isSwitched.value = value;
                                  },
                                  activeTrackColor: Colors.green,
                                  activeColor: Colors.black12,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('txt_prod_segmento_prod_normatizados'.tr)
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(
                          () => controller.isLoading.value == true
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : controller.isSwitched.value
                                  ? Expanded(
                                      child: ListView.separated(
                                        separatorBuilder: (_, i) => Divider(
                                          height: 0,
                                          thickness: 1,
                                        ),
                                        padding: EdgeInsets.only(bottom: 130),
                                        itemCount: controller.produtosWithNorm.length,
                                        itemBuilder: (context, index) {
                                          ProductNameSegmentModel produto = controller.produtosWithNorm[index];

                                          if (produto.isNorm!) {
                                            return TileNomeSegment(
                                              product: produto,
                                              function: () {
                                                Get.toNamed('/produto_info', arguments: produto.productId!.toString());
                                              },
                                            );
                                          } else {
                                            return Container();
                                          }
                                        },
                                      ),
                                    )
                                  : Expanded(
                                      child: ListView.separated(
                                        separatorBuilder: (_, i) => Divider(
                                          height: 0,
                                          thickness: 1,
                                        ),
                                        padding: EdgeInsets.only(bottom: 130),
                                        itemCount: controller.produtos.value.productModelList!.length,
                                        itemBuilder: (context, index) {
                                          ProductNameSegmentModel produto = controller.produtos.value.productModelList![index];
                                          return TileNomeSegment(
                                            product: produto,
                                            function: () {
                                              Get.toNamed('/produto_info', arguments: produto.productId!.toString());
                                            },
                                          );
                                        },
                                      ),
                                    ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
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
  }
}
