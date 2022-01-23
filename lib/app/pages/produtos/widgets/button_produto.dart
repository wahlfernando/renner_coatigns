import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ButtonProduto extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ButtonProduto({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          height: 80,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey[300],
            primary: Colors.white,
            onPrimary: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 4,
          ),
          onPressed: onPressed,
          child: Text(text, textAlign: TextAlign.center, style: font14BoldRed),
        ),
      ),
    );
  }
}
