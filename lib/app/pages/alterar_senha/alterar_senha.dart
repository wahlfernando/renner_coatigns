import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/data/model/reset_senha/reset_senha_model.dart';
import 'package:renner_coatings/app/data/repository/reset_senha/reset_senha_repository.dart';
import 'package:renner_coatings/app/modules/home/home_controller.dart';

class AlterarSenha extends GetWidget<HomeController> {

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
                Text("Recuperação de Senha", textAlign: TextAlign.center,),
                Container(
                  child: Icon(
                    Icons.close,
                    color: kWhite,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
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
                Text("Recuperação de Senha", textAlign: TextAlign.center,),
                InkWell(
                  onTap: (){
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
      appBar: Appbar(
        titleText: "tit_alterar_senha",
        isButtonBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Text(
              "desc_alterar_senha".tr,
              style: font18Light,
            ),
            SizedBox(height: 40),
            TextButton(
                onPressed: () async{
                  controller.getMyUser();
                  ResetSenha resetSenha = ResetSenha();
                  ResetSenhaRepository resetSenhaRepository = ResetSenhaRepository();

                  String? message;
                  if(controller.user.value.email == null){
                    Get.rawSnackbar(
                      messageText: Center(child: Text("E-mail INVÁLIDO. Verifique seu cadastro.", style: TextStyle(color: kRed, fontWeight: FontWeight.w700))),
                      backgroundColor: HexColor("EFEFEF"),
                    );
                  } else{
                    try {
                      resetSenha = await resetSenhaRepository.resetSenha("${controller.user.value.email}");
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
                height: 30,
                alignment: Alignment.center,
                child: Text("btn_alterar_senha".tr, style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kRed),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
