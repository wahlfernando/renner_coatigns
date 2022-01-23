import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/search_form.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/fispqs_bts/fispqs_bts_controller.dart';
import 'package:renner_coatings/app/pages/fispqs_bts/widgets/tile_item.dart';

class FispqsBts extends GetWidget<FispqsBtsController> {
  const FispqsBts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(titleText: "FISPQ’s e BT’s", isButtonBack: true),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
        child: Column(
          children: [
            SearchForm(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Produto",
                        style: font14RegularGrey,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "FISPQ's",
                        style: font14RegularGrey,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "BT's",
                        style: font14RegularGrey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Obx(
              () => controller.loading.value == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(bottom: 30),
                        separatorBuilder: (_, i) => SizedBox(height: 20),
                        itemCount: controller.fispqsBtsList.value.fispqsBtsModelList!.length,
                        itemBuilder: (_, i) => TileItemFispqsBts(
                          textTile: controller.fispqsBtsList.value.fispqsBtsModelList![i].productName!,
                          urlFISPQ: controller.fispqsBtsList.value.fispqsBtsModelList![i].fispqsLink! == "" ? null : controller.fispqsBtsList.value.fispqsBtsModelList![i].fispqsLink!,
                          urlBT: controller.fispqsBtsList.value.fispqsBtsModelList![i].btLink! == "" ? null : controller.fispqsBtsList.value.fispqsBtsModelList![i].btLink!,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
