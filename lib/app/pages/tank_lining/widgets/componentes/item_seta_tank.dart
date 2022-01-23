import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ItemSetaTank extends StatelessWidget {

  late String texto;
  final VoidCallback function;

  ItemSetaTank({required this.texto, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: function,
          child: Ink(
            height: 70,
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(texto, style: font18Bold),
                    Icon(Icons.arrow_forward_ios, color: kBlack, size: 18)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
