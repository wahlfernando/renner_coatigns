import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ItemSetaTankLining extends StatelessWidget {
  final String texto;
  final VoidCallback function;

  ItemSetaTankLining({required this.texto, required this.function});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: function,
            child: Ink(
              height: 50,
              color: Colors.transparent,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(texto,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: font18Bold),
                      ),
                      Icon(Icons.arrow_forward_ios, color: kBlack, size: 18)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
