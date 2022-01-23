import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/data/model/product/product_name_model.dart';
import 'package:renner_coatings/app/modules/home/home_controller.dart';
import 'package:renner_coatings/app/modules/locais_lojas/locais_lojas_controller.dart';
import 'bottonNavigatorItem.dart';
import 'package:get/get.dart';

import 'hexcolor.dart';

class CustonNavigatorBar extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: HexColor("ED1C24"),
      currentIndex: controller.tabIndex,
      onTap: (index) {
        controller.changeTabIndex(index);
        if (index == 0) {
          Get.back();
          Get.toNamed("/home");
        }
        if (index == 1) {
          Get.back();
          Get.toNamed("/locais_lojas");
        }
        if (index == 2) {
          Get.back();
          Get.toNamed("/conta");
        }
      },
      items: [
        bottomNavigationBarItem(
          icon: CupertinoIcons.house_fill,
          label: 'Home',
        ),
        bottomNavigationBarItem(
          icon: CupertinoIcons.location_solid,
          label: "locais".tr,
        ),
        bottomNavigationBarItem(
          icon: CupertinoIcons.person_fill,
          label: "conta".tr,
        ),
      ],
    );
  }
}
