import 'package:flutter/material.dart';
import 'hexcolor.dart';

class ColorGradientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [HexColor('FFFFFF'), HexColor('D5D5D5')],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
  }
}
