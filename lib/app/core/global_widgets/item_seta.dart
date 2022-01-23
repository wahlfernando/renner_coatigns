import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ItemSeta extends StatelessWidget {

  late String texto;
  final VoidCallback function;
  final bool divider;

  ItemSeta({required this.texto, required this.function, required this.divider });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 1),
      child: Wrap(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: function,
              child: Ink(
                height: 50,
                color: Colors.transparent,
                child: Center(
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
          divider ? Divider() : Container()
        ],

      ),
    );
  }
}
