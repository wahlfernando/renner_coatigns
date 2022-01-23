import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/data/repository/login/login_repository.dart';
import 'package:renner_coatings/app/modules/login/login_controller.dart';
import 'package:renner_coatings/app/pages/home/home.dart';
import 'package:renner_coatings/app/pages/step_um/widgets/fundo_imagem_top.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController senhaEditingController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode senhaFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      void _showDialogLoginFalha() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Falha no Login",
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      controller.loading = false;
                      Navigator.pop(context);
                      senhaFocusNode.requestFocus();
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
                "Falha ao efetuar o login.\nTente novamente "
                "ou entre com contato com o suporte.",
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    child: Text("  Entendi  "),
                    style: ElevatedButton.styleFrom(
                      primary: kRed,
                      onPrimary: kWhite,
                      shadowColor: kGrey,
                      elevation: 5,
                    ),
                    onPressed: () {
                      controller.loading = false;
                      Navigator.pop(context);
                      senhaFocusNode.requestFocus();
                    },
                  ),
                )
              ],
            );
          },
        );
      }

      void _showDialogConexao() {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Falha no Login - Conexao Internet",
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      controller.loading = false;
                      Navigator.pop(context);
                      senhaFocusNode.requestFocus();
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
                "Falha ao efetuar o login.\nSeu aparelho pode estar sem conexão com a internet.",
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: ElevatedButton(
                    child: Text("  Entendi  "),
                    style: ElevatedButton.styleFrom(
                      primary: kRed,
                      onPrimary: kWhite,
                      shadowColor: kGrey,
                      elevation: 5,
                    ),
                    onPressed: () {
                      controller.loading = false;
                      Navigator.pop(context);
                      senhaFocusNode.requestFocus();
                    },
                  ),
                )
              ],
            );
          },
        );
      }

      getLogin() async {
        LoginRepository loginRepository = LoginRepository();

        if (controller.conexao == "sem_conexao") {
          _showDialogConexao();
        }

        try {
          controller.loading = true;
          var loginOk = await loginRepository.postLogin(
              emailEditingController.text.trim(),
              senhaEditingController.text.trim());

          controller.loading = false;

          // Get.toNamed("/home");
          Get.offAllNamed("/home");
        } on DioError catch (e) {
          _showDialogLoginFalha();
        }
      }

      controller.verificaLogin();

      return Scaffold(
        body: Stack(
          children: [
            ColorGradientScreen(),
            SingleChildScrollView(
              child: FundoImagemTop(
                heightTop: 50,
                height: 600,
                children: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Text(
                        "acesse_agora".tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: "HelveticaNeue",
                            fontWeight: FontWeight.w600,
                            color: kBlack),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: HexColor("ACACAC"),
                            fontSize: 18,
                            fontFamily: FontFamily.helveticaNeue),
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          labelText: "E-mail",
                          fillColor: HexColor("DEDEDE"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: HexColor("DEDEDE"),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: HexColor("DEDEDE"),
                            ),
                          ),
                        ),
                        textAlign: TextAlign.start,
                        controller: emailEditingController,
                        focusNode: emailFocusNode,
                        onChanged: (text) {
                          //controller.checktext(text);
                        },
                        autocorrect: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: HexColor("ACACAC"),
                            fontSize: 18,
                            fontFamily: FontFamily.helveticaNeue),
                        textInputAction: TextInputAction.go,
                        onFieldSubmitted: (value) {
                          getLogin();
                        },
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          labelText: "senha".tr,
                          fillColor: HexColor("DEDEDE"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: HexColor("DEDEDE"),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: HexColor("DEDEDE"),
                            ),
                          ),
                          suffix: Material(
                            child: InkWell(
                              onTap: () {
                                controller.obscureTextUpdate();
                              },
                              child: controller.isObscureTextSenha
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                        ),
                        obscureText: controller.isObscureTextSenha,
                        textAlign: TextAlign.start,
                        controller: senhaEditingController,
                        focusNode: senhaFocusNode,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed("/recuperar_senha",
                                arguments: emailEditingController.text.trim());
                          },
                          child: Ink(
                            height: 20,
                            child: Text(
                              "esqueceu_senha".tr,
                              style: TextStyle(
                                  fontSize: 14, fontFamily: "HelveticaNeue"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 300, height: 60),
                          child: ElevatedButton(
                            onPressed: () async {
                              getLogin();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("ED1C24"),
                              onPrimary: Colors.grey[900],
                              shadowColor: Colors.black54,
                              elevation: 2,
                            ),
                            child: controller.loading
                                ? CircularProgressIndicator(color: kWhite)
                                : Text("entrar".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: kWhite),
                                    textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 300, height: 60),
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.toNamed("/cadastro_user");
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 1,
                                color: kDarkGrey,
                              ),
                              primary: Colors.transparent,
                              shadowColor: Colors.white24,
                              elevation: 0,
                            ),
                            child: Wrap(
                              alignment: WrapAlignment.end,
                              children: [
                                Text("cadastrar".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: kDarkGrey),
                                    textAlign: TextAlign.center),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(Icons.arrow_forward_ios_sharp,
                                    color: kDarkGrey),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
