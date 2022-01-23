import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';

const Color cinzaEscuro = Color(0xFF58585A);
const Color cinzaEscuroMedio = Color(0xFF909090);

class CardStore extends StatelessWidget {
  final VoidCallback? function;
  final String? nome_loja;
  final String? endereco;
  final String? str_fone;
  final String? str_km;
  final String? tipo;


  CardStore(
      {required this.function,
      this.nome_loja,
      this.endereco,
      this.str_fone,
      this.str_km,
      this.tipo});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Container(
        color: HexColor("FFFFFF"),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(nome_loja!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                        style: font14Bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(str_km!,
                        style: TextStyle(fontSize: 12, color: cinzaEscuroMedio)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(endereco!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(fontSize: 14, color: cinzaEscuro)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(str_fone!,
                        style: TextStyle(fontSize: 14, color: cinzaEscuro)),
                    Material(
                      child: InkWell(
                        onTap: function,
                        child: Ink(
                          height: 30,
                          width: 30,
                          color: HexColor("2489FF"),
                          child: Center(
                              child: Text(
                            "IR",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(tipo!,
                    style: TextStyle(fontSize: 12, color: cinzaEscuro)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
