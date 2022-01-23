import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class TileNomeSetaNormas extends InkWell {
  final VoidCallback? function;
  final String texto;

  TileNomeSetaNormas({this.function, required this.texto})
      : super(
          onTap: function,
          child: Container(
            height: 30,
            margin: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                          texto,
                      style: font18Bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    )),
                    Icon(Icons.arrow_forward_ios_outlined, size: 13),
                  ],
                ),
              ],
            ),
          ),
        );
}
