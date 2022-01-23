import 'dart:ui';

import 'package:flutter/material.dart';

class CountryFlag extends Container {
  CountryFlag({required String pathImage, bool isGrey = false})
      : super(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: isGrey
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
                    child: Image.asset(
                      pathImage,
                      height: 20,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    pathImage,
                    height: 20,
                  ),
                ),
        );
}
