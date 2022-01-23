import 'package:flutter/material.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';

class TermosUso extends StatelessWidget {
  const TermosUso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFEFEF'),
      appBar: Appbar(
        titleText: "tit_termosUso",
        isButtonBack: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: RichText(
            text: TextSpan(
                text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor i ncididunt ut labore et dolore magna aliqua.\n\n",
                style: TextStyle(fontSize: 16, color: HexColor('222222'), fontFamily: "HelveticaNeue"),
                children: [
                  TextSpan(
                      text:
                          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\n"),
                  TextSpan(
                      text:
                          "Excepteur sint occaecat cupidatat non proide, sunt in culpa qui officia deserunt mollit anim id est laborum ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ncidid ut labore et dolore magna aliqua.\n\n"),
                  TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor i ncididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi utaliquip ex ea commodo consequat.\n\n"),
                  TextSpan(
                      text:
                          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proide, sunt in culpa qui officia deserunt mollit anim id est laborum ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ncidid ut labore et dolore magna aliqua.\n\n"),
                ]),
          ),
        ),
      ),
    );
  }
}
