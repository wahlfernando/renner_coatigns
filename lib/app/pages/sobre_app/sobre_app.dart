import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';

class SobreApp extends StatelessWidget {
  const SobreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFEFEF'),
      appBar: Appbar(
        titleText: "tit_sobreApp",
        isButtonBack: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor i ncididunt ut labore et dolore magna aliqua.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nExcepteur sint occaecat cupidatat non proide, sunt in culpa qui officia deserunt mollit anim id est laborum ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ncidid ut labore et dolore magna aliqua.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Imagem Logo Asteria
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Image.asset('assets/images/logo_asteria.png', width: 60, height: 60),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "v1.0.0\n",
                      style: TextStyle(color: Colors.black, fontSize: 10),
                      children: [
                        TextSpan(
                          text: "Powered by\n",
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        TextSpan(
                          text: "Astéria Internet Solutions\n",
                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
