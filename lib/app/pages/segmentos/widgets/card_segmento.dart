import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class CardSegmento extends Container {
  CardSegmento({String? titleCard, bool? isNew, String? urlIcon, VoidCallback? onTap})
      : super(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: HexColor("DEDEDE")),
            boxShadow: [BoxShadow(color: HexColor("DEDEDE"), blurRadius: 8, spreadRadius: 2, offset: Offset(2, 2))],
          ),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: onTap ?? () {},
              child: Stack(
                children: [
                  Visibility(
                    visible: isNew ?? false,
                    child: Positioned(
                      top: 13,
                      right: 13,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 3),
                        decoration: BoxDecoration(color: kRed, borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Novo",
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        urlIcon != null
                            ? Image.network(
                                urlIcon,
                                height: 35,
                              )
                            : Image.asset(
                                "assets/images/segment.png",
                                height: 35,
                              ),
                        SizedBox(height: 7),
                        Container(
                          width: double.maxFinite,
                          child: Text(
                            titleCard ?? "Texto",
                            style: font12Regular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
}
