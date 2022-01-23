import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/data/model/reset_senha/reset_senha_model.dart';
import 'package:renner_coatings/app/data/repository/reset_senha/reset_senha_repository.dart';
import 'package:renner_coatings/app/pages/step_um/widgets/fundo_imagem_top.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecuperarSenha extends StatelessWidget {
  final argumento = Get.arguments;

  @override
  Widget build(BuildContext context) {
    void _showDialogRecSenha() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recuperação de Senha",
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.close,
                      color: kWhite,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              "Você solicitou uma recuperação de senha.\nVerifique seu "
              "email para concluir o processo de recuperação de senha.",
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  child: Text("  OK  "),
                  style: ElevatedButton.styleFrom(
                    primary: kRed,
                    onPrimary: kWhite,
                    shadowColor: kGrey,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Get.toNamed("/login");
                  },
                ),
              )
            ],
          );
        },
      );
    }

    void _showDialogRecSenhaFalha(String message) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recuperação de Senha",
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Icon(
                      Icons.close,
                      color: kWhite,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              "Você solicitou uma recuperação de senha.\nNão foi concluído "
              "esse processo, por favor verifique a conexão coma internet "
              "e tente novamente.\n\n$message",
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: ElevatedButton(
                  child: Text("  OK  "),
                  style: ElevatedButton.styleFrom(
                    primary: kRed,
                    onPrimary: kWhite,
                    shadowColor: kGrey,
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          ColorGradientScreen(),
          SingleChildScrollView(
            child: FundoImagemTop(
              heightTop: 50,
              height: 550,
              children: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'tit_resuperar_senha'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "HelveticaNeue",
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'txt_solicite'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "HelveticaNeue",
                      ),
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () async {
                        ResetSenha resetSenha = ResetSenha();
                        ResetSenhaRepository resetSenhaRepository =
                            ResetSenhaRepository();

                        String? message;
                        if (argumento == null) {
                          Get.rawSnackbar(
                            messageText: Center(
                                child: Text(
                                    "Favor colocar um e-mail valido na tela de login.",
                                    style: TextStyle(
                                        color: kRed,
                                        fontWeight: FontWeight.w700))),
                            backgroundColor: HexColor("EFEFEF"),
                          );
                        } else {
                          try {
                            resetSenha = await resetSenhaRepository
                                .resetSenha(argumento);
                            message = resetSenha.message;
                            print(message);

                            _showDialogRecSenha();
                          } on DioError catch (e) {
                            _showDialogRecSenhaFalha(message!);
                          }
                        }
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text("btn_rec_senha".tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(HexColor('ED1C24')),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 185),
                      child: TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'btn_rec_voltar'.tr,
                          style: TextStyle(
                              fontSize: 18, color: HexColor('ED1C24')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
