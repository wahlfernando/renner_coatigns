import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';

class FundoImagemTop extends StatelessWidget {
  //heightTop = altura da imagem da renner até o proximo widget;
  //height = altura do container branco;
  // children = Os filhos dentro do container;

  late final double height;
  late final double heightTop;
  Widget children;

  FundoImagemTop({required this.height, required this.children, required this.heightTop});

  @override
  build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 140, 25, 0),
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor("FFFFFF"),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50 + heightTop,
                        width: MediaQuery.of(context).size.width,
                      ),
                      children
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Imagem - não alterar
          Padding(
            padding: const EdgeInsets.fromLTRB(72, 110, 72, 8),
            child: Image.asset(
              'assets/images/logo_renner.png',
              width: 270,
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}
