import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:get/get.dart';

class TabBarProduto extends TabBar {
  TabBarProduto()
      : super(
          labelColor: kRed,
          labelStyle: font16RegularRed,
          unselectedLabelStyle: font16Regular,
          unselectedLabelColor: Colors.black,
          indicatorColor: kRed,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1,
          labelPadding: EdgeInsets.only(bottom: 5),
          tabs: [
            Text("txt_geral".tr),
            Text("txt_cores".tr),
          ],
        );
}
