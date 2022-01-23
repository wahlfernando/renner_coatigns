import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_controller.dart';
import 'package:renner_coatings/app/pages/locais_lojas/widgets/card_store.dart';
import 'package:renner_coatings/app/pages/locais_lojas/widgets/carousel_controller.dart';
import 'package:renner_coatings/app/pages/login/widgets/search_form_stores.dart';


class LocaisLojas extends GetWidget<LocaisLojasController> {

  TextEditingController searchEditingController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  final CategoriesScroller categoriesScroller = CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(titleText: "tit_onde_encontrar".tr, isButtonBack: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Container(
                height: 48,
                child: SearchFormStores(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                child: Container(
                  height: 80,
                  child: categoriesScroller,
                ),
              ),
              Expanded(
                child: GetBuilder<LocaisLojasController>(builder: (controller) {
                  return controller.locaisLojasModel == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: controller.locaisLojasModel!.length,
                          itemBuilder: (context, index) {
                            controller.distanciaKm(index);
                            controller.locaisLojasModel!.sort((a, b) => a.km!.compareTo(b.km!));
                            return CardStore(
                                nome_loja:"${controller.locaisLojasModel![index].name}",
                                endereco: "${controller.locaisLojasModel![index].address}, "
                                    "${controller.locaisLojasModel![index].numberAddress}, "
                                    "${controller.locaisLojasModel![index].city}, "
                                     "${controller.locaisLojasModel![index].state} - "
                                    "${controller.locaisLojasModel![index].country} ",
                                str_fone:"${controller.locaisLojasModel![index].phoneNumber}",
                                str_km: "${controller.locaisLojasModel![index].km} Km",
                                tipo: "${controller.locaisLojasModel![index].type}",
                                function: () async {
                                  void _showDialog() {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  Get.back();
                                                },
                                                child: Container(
                                                  child: Icon(
                                                    Icons.close,
                                                    color: kWhite,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: Container(
                                            height: 150,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Escolha qual plataforma você deseja navegar",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 16, fontFamily: FontFamily.helveticaNeue),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        controller.launchGoogleMaps(controller.locaisLojasModel![index].latitude,
                                                            controller.locaisLojasModel![index].longitude);
                                                      },
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons.google,
                                                            size: 22,
                                                            color: HexColor("ED1C24"),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Google Maps",
                                                            style: TextStyle(color: Colors.black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Get.back();
                                                        controller.launchWaze(controller.locaisLojasModel![index].latitude,
                                                            controller.locaisLojasModel![index].longitude);
                                                      },
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons.waze,
                                                            size: 22,
                                                            color: HexColor("33CCFF"),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "Waze",
                                                            style: TextStyle(color: Colors.black),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )

                                        );
                                      },
                                    );
                                  }
                                  _showDialog();
                                });
                          });
                }),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }

}
