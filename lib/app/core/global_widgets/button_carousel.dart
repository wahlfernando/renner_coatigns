import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class BottonCarrousel extends StatelessWidget {
  late String texto;
  final VoidCallback function;
  bool color;


  BottonCarrousel({required this.texto, required this.function, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
       color: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 150, height: 72),
        child: ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)),
              primary: color ? Colors.grey.shade400 : HexColor("FFFFFF"),
              onPrimary: Colors.grey[900],
              shadowColor: Colors.black54,
              elevation: 1,
            ),
            child: Text(texto,style: font14BoldRed,textAlign: TextAlign.center)),
      ),
    );

  }
}
