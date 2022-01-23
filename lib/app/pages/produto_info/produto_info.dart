import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/panel_up.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/produto_info/produto_info_controller.dart';
import 'package:renner_coatings/app/core/global_widgets/country_flag.dart';
import 'package:renner_coatings/app/pages/produto_info/widgets/produto_cores.dart';
import 'package:renner_coatings/app/pages/produto_info/widgets/produto_geral.dart';
import 'package:renner_coatings/app/pages/produto_info/widgets/tab_bar_produto.dart';
import 'package:renner_coatings/app/pages/produto_info/widgets/tile_item.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ProdutoInfo extends GetWidget<ProdutoInfoController> {

  PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdutoInfoController>(
      builder: (controller) {
        return SlidingUpPanel(
          body: Scaffold(
            backgroundColor: HexColor("EFEFEF"),
            appBar: Appbar(titleText: "", isButtonBack: true),
            body: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Scaffold(
                      backgroundColor: HexColor("EFEFEF"),
                      appBar: PreferredSize(
                        preferredSize: Size.fromHeight(125),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      controller.produto!.productName!,
                                      style: font16Bold,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Expanded(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: "txt_prod_info_codigo".tr,
                                        style: font10RegularGrey,
                                        children: [
                                          TextSpan(
                                            text: controller.produto!.productCod,
                                            style: font10RegularRed,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(width: 130, child: TabBarProduto()),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("txt_prod_info_disponivel_em".tr,
                                              style: font10Regular),
                                          SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    titlePadding:
                                                        EdgeInsets.fromLTRB(
                                                            8, 8, 8, 0),
                                                    actionsPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8,
                                                            horizontal: 8),
                                                    title: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                  FontAwesomeIcons
                                                                      .solidTimesCircle,
                                                                  size: 18),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          "band_disponibilidade"
                                                              .tr,
                                                          style: font16Bold,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    ),
                                                    content: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        _panelController.open();
                                                      },
                                                      child: RichText(
                                                        text: TextSpan(
                                                          text:
                                                              "band_descricao".tr,
                                                          style: font14Regular,
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "band_clicando_aqui"
                                                                      .tr,
                                                              style:
                                                                  font14BoldRed,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    actions: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "band_se_preferir".tr,
                                                            style: font12Regular,
                                                            textAlign:
                                                                TextAlign.justify,
                                                            softWrap: true,
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10),
                                                      OutlinedButton(
                                                        style:
                                                            TextButton.styleFrom(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 15,
                                                                  vertical: 15),
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                        onPressed: () async {
                                                          final link = WhatsAppUnilink(
                                                              phoneNumber:
                                                                  "+55 41 3341-3400",
                                                              text:
                                                                  "band_txt_whats"
                                                                      .tr);
                                                          await launch("$link");
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                                "band_via_whats"
                                                                    .tr,
                                                                style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: HexColor(
                                                                        "909090"))),
                                                            Container(
                                                              width: 20,
                                                              height: 20,
                                                              child: Image.asset(
                                                                  "assets/icons/icon_whatsapp.png",
                                                                  fit: BoxFit
                                                                      .cover),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(Icons.help_outline,
                                                size: 15, color: kRed),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 7),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CountryFlag(
                                              pathImage:
                                                  "assets/icons/brasil_flag.png",
                                              isGrey: !controller
                                                  .produto!.countrybr!),
                                          SizedBox(width: 9),
                                          CountryFlag(
                                              pathImage:
                                                  "assets/icons/chile_flag.png",
                                              isGrey: !controller
                                                  .produto!.countrych!),
                                          SizedBox(width: 9),
                                          CountryFlag(
                                              pathImage:
                                                  "assets/icons/peru_flag.png",
                                              isGrey: !controller
                                                  .produto!.countrype!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      body: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          controller.produto!.bts!.length > 0
                              ? ProdutoGeral(
                                  description: controller.produto!.description!,
                                  listDocumentos: [
                                    TileItem(
                                      textTile: "BTS",
                                      urlFile: controller.produto!.bts![0],
                                    ),
                                  ],
                                  listNormas: List.generate(
                                    controller.produto!.norms!.length,
                                    (i) => TileItem(
                                        textTile:
                                            controller.produto!.norms![i].norm!),
                                  ),
                                )
                              : ProdutoGeral(
                                  description: controller.produto!.description!,
                                  listNormas: List.generate(
                                    controller.produto!.norms!.length,
                                    (i) => TileItem(
                                        textTile:
                                            controller.produto!.norms![i].norm!),
                                  ),
                                ),
                          ProdutoCores(),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: CustonNavigatorBar(),
          ),
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height * 0.53,
          controller: _panelController,
          panel: PanelUp(panelCloseFun: () {
              _panelController.close();
          }),
        );
      },
    );
  }
}
