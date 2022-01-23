import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

class ItemResultAgentes extends StatelessWidget {
  final String texto;
  final VoidCallback function;
  final int? optIcon;

  ItemResultAgentes(
      {required this.texto, required this.optIcon, required this.function});

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
                      optIcon == 1
                          ? Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: HexColor("009517"),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: HexColor("ED1C24"),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            )
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
