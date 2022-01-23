import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/data/model/register/register_model.dart';
import 'package:renner_coatings/app/data/repository/register/register_repository.dart';
import 'package:renner_coatings/app/modules/cadastro_user/cadastro_user_controller.dart';
import 'package:renner_coatings/app/pages/step_um/widgets/fundo_imagem_top.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroUser extends StatelessWidget {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController senhaEditingController = TextEditingController();
  TextEditingController confirmaSenhaEditingController = TextEditingController();

  FocusNode nomeFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode senhaFocusNode = FocusNode();
  FocusNode confirmaSenhaFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    void _showDialogPolitica() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "cadUser_atencao".tr,
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
              "cadUser_txtmsg".tr,
              textAlign: TextAlign.center,
            ),
            actions: [
              ElevatedButton(
                child: Text("cadUser_fechar".tr),
                style: ElevatedButton.styleFrom(
                  primary: kRed,
                  onPrimary: kWhite,
                  shadowColor: kGrey,
                  elevation: 5,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Text("cadUser_msg_politica".tr),
                style: ElevatedButton.styleFrom(
                  primary: kRed,
                  onPrimary: kWhite,
                  shadowColor: kGrey,
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Get.toNamed("/politica_privacidade", arguments: true);
                },
              )
            ],
          );
        },
      );
    }
    void _showDialogRegistro(String title) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
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
              "Falha ao registrar novo usuário(a). \E-Mail ja registrao em nosso banco de dados!",
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
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        },
      );
    }

    return GetBuilder<CadastroUserController>(builder: (controller) {
      return Scaffold(
        body: Stack(
          children: [
            ColorGradientScreen(),
            SingleChildScrollView(
              child: FundoImagemTop(
                heightTop: 50,
                height: 650,
                children: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          //nome
                          TextFormField(
                            style: TextStyle(
                                color: HexColor("ACACAC"),
                                fontSize: 18,
                                fontFamily: FontFamily.helveticaNeue),
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              labelText: "cadUser_nome".tr,
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
                            controller: nameEditingController,
                            focusNode: nomeFocusNode,
                            validator: (value) {
                              controller.validaCampos(value!, "nome");
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //email
                          TextFormField(
                            style: TextStyle(
                                color: HexColor("ACACAC"),
                                fontSize: 18,
                                fontFamily: FontFamily.helveticaNeue),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
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
                            autocorrect: false,
                            validator: (value) {
                              controller.validaCampos(value!, "email");
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          // senha
                          TextFormField(
                            style: TextStyle(
                                color: HexColor("ACACAC"),
                                fontSize: 18,
                                fontFamily: FontFamily.helveticaNeue),
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v){
                              FocusScope.of(context).requestFocus(confirmaSenhaFocusNode);
                            },
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              labelText: "cadUser_senha".tr,
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
                            validator: (value) {
                              controller.validaCampos(value!, "senha");
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //confirma senha
                          TextFormField(
                            style: TextStyle(
                                color: HexColor("ACACAC"),
                                fontSize: 18,
                                fontFamily: FontFamily.helveticaNeue),
                            textInputAction: TextInputAction.next,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.black87,
                              ),
                              labelText: "cadUser_confirmar_senha".tr,
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
                                    controller.obscureTextConfirmaSenhaUpdate();
                                  },
                                  child: controller.isObscureTextConfirmaSenha
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                ),
                              ),
                            ),
                            obscureText: controller.isObscureTextConfirmaSenha,
                            textAlign: TextAlign.start,
                            controller: confirmaSenhaEditingController,
                            focusNode: confirmaSenhaFocusNode,
                            onChanged: (text) {},
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: kRed,
                                onChanged: (value) {
                                  controller.valueCheckBoxTermsChanged();
                                },
                                value: controller.valueCheckBoxTerms,
                              ),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: FontFamily.helveticaNeue,
                                        fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'cadUser_li_eAceito_os'.tr,
                                          style: TextStyle(color: kGrey)),
                                      TextSpan(
                                          text: 'cadUser_termosUso'.tr,
                                          style: TextStyle(
                                              color: kRed,
                                              fontWeight: FontWeight.w600),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              // Get.toNamed("/termos");
                                            }),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: kRed,
                                onChanged: (value) {
                                  if(controller.valueCheckBoxPolicy){
                                    controller.valueCheckBoxPolicyDesmarcaMarca();
                                    print("sdfsdfsdfsdfsdfsdfsdf");
                                  } else{
                                    Get.toNamed("/politica_privacidade",
                                        arguments: true);
                                  }
                                },
                                value: controller.valueCheckBoxPolicy,
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: FontFamily.helveticaNeue,
                                        fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'cadUser_liAceito_a'.tr,
                                          style: TextStyle(color: kGrey)),
                                      TextSpan(
                                          text:
                                              'cadUser_políticaPrivacidade'.tr,
                                          style: TextStyle(
                                              color: kRed,
                                              fontWeight: FontWeight.w600),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                                Get.toNamed("/politica_privacidade",
                                                    arguments: true);
                                            }),
                                      TextSpan(
                                        text: ' e ',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 300, height: 60),
                              child: ElevatedButton(
                                onPressed: () async {
                                  //verifica campos nulos
                                  if (nameEditingController.text.isEmpty ||
                                      emailEditingController.text.isEmpty ||
                                      senhaEditingController.text.isEmpty ||
                                      confirmaSenhaEditingController
                                          .text.isEmpty ||
                                      controller.valueCheckBoxTerms == false) {
                                    Get.defaultDialog(
                                      barrierDismissible: false,
                                      title: "Cadastro Renner",
                                      titleStyle: TextStyle(
                                          fontFamily: FontFamily.helveticaNeue),
                                      middleText:
                                          "Existem campos a serem preenchidos, por favor preencha os campos.\nTodos os campos são obrigatórios para o registro!",
                                      middleTextStyle: TextStyle(
                                          fontFamily: FontFamily.helveticaNeue),
                                      backgroundColor: Colors.white,
                                      radius: 2,
                                      actions: [
                                        ElevatedButton(
                                          child: Text("Entendi"),
                                          style: ElevatedButton.styleFrom(
                                            primary: kRed,
                                            onPrimary: kWhite,
                                            shadowColor: kGrey,
                                            elevation: 5,
                                          ),
                                          onPressed: () => Get.back(),
                                        ),
                                      ],
                                    );
                                  } else {
                                    if (confirmaSenhaEditingController.text !=
                                        senhaEditingController.text) {
                                      confirmaSenhaFocusNode.requestFocus();

                                      Get.rawSnackbar(
                                        messageText: Center(
                                            child: Text(
                                                "Senhas não são iguais!",
                                                style: TextStyle(
                                                    color: kRed,
                                                    fontWeight:
                                                        FontWeight.w700))),
                                        backgroundColor: HexColor("EFEFEF"),
                                      );
                                    } else {
                                      if (controller.valueCheckBoxPolicy ==
                                          false) {
                                        _showDialogPolitica();
                                      } else {
                                        //TODO: procedimento de gravar os dados
                                        RegisterRepository registerRepository =
                                            RegisterRepository();
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        String? retorno;
                                        try {
                                          var data = await registerRepository
                                              .postRegistro(
                                                  nameEditingController.text,
                                                  emailEditingController.text,
                                                  senhaEditingController.text,
                                                  controller
                                                      .valueCheckBoxPolicy,
                                                  controller
                                                      .valueCheckBoxTerms);

                                          prefs.setString("cad_nome",
                                              nameEditingController.text);
                                          prefs.setString("cad_email",
                                              emailEditingController.text);

                                          //msg de cadastro realziado com sucesso
                                          Get.defaultDialog(
                                            barrierDismissible: false,
                                            title: "Cadastro Renner",
                                            titleStyle: TextStyle(
                                                fontFamily:
                                                    FontFamily.helveticaNeue),
                                            middleText:
                                                "Seu cadastro foi realizado com sucesso!",
                                            middleTextStyle: TextStyle(
                                                fontFamily:
                                                    FontFamily.helveticaNeue),
                                            backgroundColor: Colors.white,
                                            radius: 2,
                                            actions: [
                                              ElevatedButton(
                                                child: Text("Entendi"),
                                                style: ElevatedButton.styleFrom(
                                                  primary: kRed,
                                                  onPrimary: kWhite,
                                                  shadowColor: kGrey,
                                                  elevation: 5,
                                                ),
                                                onPressed: () =>
                                                    Get.toNamed("/login"),
                                              ),
                                            ],
                                          );
                                        } on DioError catch (e) {
                                          print(e.response);
                                          if (e.response.toString() ==
                                              "E-mail já cadastrado") {
                                            _showDialogRegistro(
                                                "${e.response}");
                                          }
                                        }
                                      }
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  shadowColor: Colors.white24,
                                  elevation: 0,
                                ),
                                child: Text("cadUser_confirmarCadastro".tr,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: kWhite),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Material(
                            color: Colors.transparent,
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  width: 150, height: 40),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Ink(
                                  child: Center(
                                    child: Text("cadUser_voltar".tr,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: kRed),
                                        textAlign: TextAlign.center),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
