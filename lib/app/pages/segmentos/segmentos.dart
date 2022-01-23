import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/data/model/segment/segments_model.dart';
import 'package:renner_coatings/app/modules/segmentos/segmentos_controller.dart';
import 'package:renner_coatings/app/pages/segmentos/widgets/card_segmento.dart';

class SegmentosPage extends GetWidget<SegmentosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("EFEFEF"),
      appBar: Appbar(
        titleText: "tit_segmentos".tr,
        isButtonBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            SearchForm(),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.isError.value == true
                        ? Center(
                            child: TextButton(
                              child: Text("txt_tente_novamente".tr),
                              onPressed: () {},
                            ),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: controller.businessUnit.value.businessUnit!.length,
                            itemBuilder: (context, index) {
                              List<Segments> segments = controller.businessUnit.value.businessUnit!;
                              segments.map((e) => e.segments);
                              Segments s = segments[index];
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        s.segments![0].businessUnit!,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () => Get.toNamed("/normas", arguments: s.segments![0].businessUnitId),
                                        child: Row(
                                          children: [
                                            Text(
                                              'normas'.tr,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.red,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: (1 / .7)),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(bottom: 10, top: 7),
                                    itemCount: s.segments!.length,
                                    itemBuilder: (_, i) => CardSegmento(
                                        titleCard: s.segments![i].segment,
                                        urlIcon: s.segments![i].iconUrl,
                                        isNew: true,
                                        onTap: () => Get.toNamed(
                                              "/produtos_por_segmento",
                                              arguments: {'nome_produto': s.segments![i].segment, 'segmento_id': s.segments![i].segmentId},
                                            )),
                                  ),
                                ],
                              );
                            },
                          ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
