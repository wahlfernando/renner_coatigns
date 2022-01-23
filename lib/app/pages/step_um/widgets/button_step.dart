import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ButtonStep extends StatelessWidget {
  late String texto;
  final VoidCallback function;
  late bool active;

  ButtonStep(
      {required this.texto, required this.function, required this.active});

  @override
  Widget build(BuildContext context) {
    if (active) {
      return Material(
        color: Colors.transparent,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 237, height: 45),
          child: ElevatedButton(
              onPressed: function,
              style: ElevatedButton.styleFrom(
                primary: HexColor("FFFFFF"),
                onPrimary: Colors.grey[900],
                shadowColor: Colors.black54,
                elevation: 2,
              ),
              child: Text(texto,
                  style: font14BoldRed, textAlign: TextAlign.center)),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: Ink(
              width: 237,
              height: 45,
              child: Center(
                child: Text(texto,
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600, color: kGrey),
                    textAlign: TextAlign.center),
              )),
        ),
      );
    }
  }
}
