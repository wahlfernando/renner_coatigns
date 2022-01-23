import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/country_flag.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/data/model/product/product_name_model.dart';

class TileNome extends InkWell {
  final VoidCallback? function;
  final ProductNameModel product;
  TileNome({this.function, required this.product})
      : super(
          onTap: function,
          child: Container(
            height: 30,
            margin: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      product.productName!,
                      style: font16Bold,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    )),
                    SizedBox(width: 5),
                    product.countrybr! ? CountryFlag(pathImage: "assets/icons/brasil_flag.png", isGrey: !product.countrybr!) : Container(),
                    product.countrych! ? CountryFlag(pathImage: "assets/icons/chile_flag.png", isGrey: !product.countrych!) : Container(),
                    product.countrype! ? CountryFlag(pathImage: "assets/icons/peru_flag.png", isGrey: !product.countrype!) : Container(),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward_ios_outlined, size: 13),
                  ],
                ),
              ],
            ),
          ),
        );
}
