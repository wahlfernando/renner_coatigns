import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

Widget expansionTileFAQ(
    {required String title, required String answer, String? link}) {
  return ExpansionTile(
    expandedCrossAxisAlignment: CrossAxisAlignment.start,
    expandedAlignment: Alignment.centerLeft,
    backgroundColor: Colors.white,
    collapsedBackgroundColor: Colors.white,
    title: Container(
      child: Text(
        title,
        style: font14Regular,
      ),
    ),
    iconColor: Colors.black,
    collapsedIconColor: Colors.black,
    childrenPadding: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
    children: [
      InkWell(
        onTap: () => print(link),
        child: Text(
          answer,
          style: font14RegularRed,
        ),
      ),
    ],
  );
}
