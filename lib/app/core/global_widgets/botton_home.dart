import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ButtonHome extends StatelessWidget {
  late String texto;
  final VoidCallback function;

  ButtonHome({required this.texto, required this.function});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 166, height: 80),
        child: ElevatedButton(
            onPressed: function,
            style: ElevatedButton.styleFrom(
              primary: HexColor("FFFFFF"),
              onPrimary: Colors.grey[900],
              shadowColor: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              elevation: 10,
            ),
            child: Text(texto,style: font14BoldRed,textAlign: TextAlign.center)),
      ),
    );

  }
}

