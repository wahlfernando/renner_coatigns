import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/appbar.dart';
import 'package:renner_coatings/app/core/global_widgets/bottom_navigation_bar.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/modules/meus_dados/meus_dados_controller.dart';
import 'package:renner_coatings/app/pages/meus_dados/widgets/text_form_field_meus_dados.dart';

class MeusDados extends GetWidget<MeusDadosController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFEFEF'),
      appBar: Appbar(
        titleText: "tit_meus_dados",
        isButtonBack: true,
      ),
      body: Obx(
        () => controller.loading.value == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [
                      TextFormFieldMeusDados(textInputType: TextInputType.text, hintText: 'nome'.tr, controller: controller.controllerName),
                      SizedBox(height: 20),
                      TextFormFieldMeusDados(textInputType: TextInputType.emailAddress, hintText: 'E-mail', isEmail: true, controller: controller.controllerEmail),
                      SizedBox(height: 20),
                      TextFormFieldMeusDados(textInputType: TextInputType.phone, hintText: 'telefone'.tr, isPhone: true, controller: controller.controllerPhoneNumber),
                      SizedBox(height: 20),
                      TextFormFieldMeusDados(textInputType: TextInputType.number, hintText: 'CPF/CNPJ', isCpfCnpj: true, controller: controller.controllerCpfCnpj),
                      SizedBox(height: 30),
                      TextButton(
                        onPressed: () => controller.updateMyInfo(),
                        child: Container(
                          width: double.maxFinite,
                          height: 30,
                          alignment: Alignment.center,
                          child: Text("atualizar".tr, style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(HexColor('ED1C24')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
      bottomNavigationBar: CustonNavigatorBar(),
    );
  }
}
