import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:renner_coatings/app/core/global_widgets/color_gradient_screen.dart';
import 'package:renner_coatings/app/core/global_widgets/font_family.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/core/theme/text_theme.dart';
import 'package:renner_coatings/app/modules/cadastro_user/cadastro_user_controller.dart';
import 'package:renner_coatings/app/modules/politica_privacidade/politica_privacidade_controller.dart';

class PoliticaPrivacidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double valor = MediaQuery.of(context).size.height;

    return GetBuilder<PoliticaPrivacidadeController>(builder: (controller) {
      final bool btAceitarTermos = Get.arguments;
      controller.btAceitarTermos = btAceitarTermos;

      controller.finalPagina();
      return Scaffold(
        body: Stack(
          children: [
            ColorGradientScreen(),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 140, 25, 0),
                  child: Container(
                    height: valor - 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: HexColor("FFFFFF"),
                    ),
                    child: SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Wrap(
                        children: [
                          SizedBox(
                            height: 80,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Wrap(
                            children: [
                              Center(
                                child: Text("politica_privacidade".tr, style: TextStyle(color: HexColor("222222"), fontSize: 18, fontFamily: FontFamily.helveticaNeue)),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              //Texto da politica de privacidade
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                                child: Container(
                                  width: Get.width,
                                  color: Colors.transparent,
                                  child: RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      style: font14Light,
                                      children: [
                                        TextSpan(
                                            text:
                                                'Segurança e Inform	ação Ltda. (a “Medicação Certa” ou “Nós”) entende a importância do dever de respeitar a privacidade e segurança das informações de seus usuários (“Usuários” ou “Vocês”), que utilizam o site https://medicacaocerta.com.vc (“Site”) e o aplicativo “Medicação Certa” (“Aplicativo”), em conjunto, “Plataforma”. Por isso, o uso de tais informações é realizado em conformidade com os regulamentos nacionais de proteção de dados, inclusive a Lei Geral de Proteção de Dados (Lei nº 13.709/2018 – “LGPD”).\n\n'),
                                        TextSpan(
                                            style: TextStyle(fontWeight: FontWeight.w600, color: kBlack),
                                            text:
                                                'Pedimos que leia com atenção esta Política de Privacidade (“Política”). Ela descreve como são tratadas as informações fornecidas por Você ao acessar e utilizar a Plataforma e/ou seus serviços. Caso Você não concorde com os termos e condições abaixo, Você não deve utilizar a nossa Plataforma.\n\n'),
                                        TextSpan(
                                            text:
                                                'Este documento é parte integrante dos Termos e Condições de Uso da Plataforma, que descrevem uma visão geral da Plataforma oferecida pela Medicação Certa. Sem prejuízo de outras definições atribuídas nesta Política, as definições que são contempladas nos Termos e Condições de Uso da Plataforma aplicam-se a esta Política.\n\n'),
                                        TextSpan(
                                            text:
                                                'Após a leitura desta Política, você poderá entrar em contato para sanar qualquer dúvida ou exercer direitos relacionados aos seus dados pessoais. Para isso, basta contatar nosso '),
                                        TextSpan(style: TextStyle(fontWeight: FontWeight.w600, color: kBlack), text: 'Encarregado (DPO) '),
                                        TextSpan(text: 'pelo e-mail privacidade@medicacaocerta.com.vc.\n\n'),
                                        TextSpan(
                                            text:
                                                'Segurança e Inform	ação Ltda. (a “Medicação Certa” ou “Nós”) entende a importância do dever de respeitar a privacidade e segurança das informações de seus usuários (“Usuários” ou “Vocês”), que utilizam o site https://medicacaocerta.com.vc (“Site”) e o aplicativo “Medicação Certa” (“Aplicativo”), em conjunto, “Plataforma”. Por isso, o uso de tais informações é realizado em conformidade com os regulamentos nacionais de proteção de dados, inclusive a Lei Geral de Proteção de Dados (Lei nº 13.709/2018 – “LGPD”).\n\n'),
                                        TextSpan(
                                            style: TextStyle(fontWeight: FontWeight.w600, color: kBlack),
                                            text:
                                                'Pedimos que leia com atenção esta Política de Privacidade (“Política”). Ela descreve como são tratadas as informações fornecidas por Você ao acessar e utilizar a Plataforma e/ou seus serviços. Caso Você não concorde com os termos e condições abaixo, Você não deve utilizar a nossa Plataforma.\n\n'),
                                        TextSpan(
                                            text:
                                                'Este documento é parte integrante dos Termos e Condições de Uso da Plataforma, que descrevem uma visão geral da Plataforma oferecida pela Medicação Certa. Sem prejuízo de outras definições atribuídas nesta Política, as definições que são contempladas nos Termos e Condições de Uso da Plataforma aplicam-se a esta Política.\n\n'),
                                        TextSpan(
                                            text:
                                                'Após a leitura desta Política, você poderá entrar em contato para sanar qualquer dúvida ou exercer direitos relacionados aos seus dados pessoais. Para isso, basta contatar nosso '),
                                        TextSpan(style: TextStyle(fontWeight: FontWeight.w600, color: kBlack), text: 'Encarregado (DPO) '),
                                        TextSpan(text: 'pelo e-mail privacidade@medicacaocerta.com.vc.\n\n'),
                                        TextSpan(text: 'Para facilitar a sua leitura, elaboramos o quadro abaixo com um breve resumo dos principais pontos abordados nesta Política:\n'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //imagem
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
            //botões
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                  child: Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        controller.btAceitarTermos
                            ? Material(
                                color: Colors.transparent,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints.tightFor(width: Get.width, height: 60),
                                  child: GetBuilder<CadastroUserController>(
                                    builder: (controllerCadastroUser) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          controllerCadastroUser.valueCheckBoxPolicyChanged();
                                          Navigator.pop(context);
                                          // if (controller.enableButton) {
                                          //   controllerCadastroUser.valueCheckBoxPolicy = true;
                                          //   Navigator.pop(context);
                                          // }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: controller.enableButton ? HexColor("ED1C24") : HexColor("D5D5D5"),
                                          shadowColor: Colors.white24,
                                          elevation: 0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("txt_liAceito".tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white), textAlign: TextAlign.center),
                                            Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        Container(
                          height: 10,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(width: Get.width, height: 60),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.white24,
                                elevation: 0,
                              ),
                              child: Text("txt_voltar".tr, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.red), textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
