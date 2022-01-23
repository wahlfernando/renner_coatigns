import 'package:cpf_cnpj_validator/cnpj_validator.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/data/model/user/user_model.dart';
import 'package:renner_coatings/app/data/repository/user/user_repository.dart';

class MeusDadosController extends GetxController {
  UserRepository userRepository = UserRepository();
  Rx<UserModel> user = UserModel().obs;
  final loading = true.obs;

  // Controller TextFormField
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhoneNumber = TextEditingController();
  TextEditingController controllerCpfCnpj = TextEditingController();

  MaskTextInputFormatter maskPhoneNumber = MaskTextInputFormatter(mask: '+## ## #########', filter: {'#': RegExp(r'[0-9]')});
  MaskTextInputFormatter maskCpf = MaskTextInputFormatter(mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
  MaskTextInputFormatter maskCnpj = MaskTextInputFormatter(mask: '##.###.###/####-##', filter: {'#': RegExp(r'[0-9]')});

  @override
  void onInit() async {
    super.onInit();
    await getMyUser();
    // Editando os TextFormField
    controllerName.text = user.value.name ?? "";
    controllerEmail.text = user.value.email ?? "";
    controllerPhoneNumber.text = user.value.phoneNumber == null ? "" : maskPhoneNumber.maskText(user.value.phoneNumber.toString());
    controllerCpfCnpj.text = user.value.cpfCnpj == null
        ? ""
        : user.value.cpfCnpj.toString().length > 13
            ? maskCnpj.maskText(user.value.cpfCnpj.toString())
            : maskCpf.maskText(user.value.cpfCnpj.toString());
  }

  getMyUser() async {
    loading.value = true;
    user.value = await userRepository.getMyUser();
    if (user.value.name != null) loading.value = false;
  }

  void updateMyInfo() {
    UserModel userInfoUpdate = UserModel();

    if (controllerCpfCnpj.text == "" ? true : CPFValidator.isValid(controllerCpfCnpj.text) || CNPJValidator.isValid(controllerCpfCnpj.text)) {
      if (controllerName.text.isNotEmpty) userInfoUpdate.name = controllerName.text;
      if (controllerPhoneNumber.text.isNotEmpty) userInfoUpdate.phoneNumber = controllerPhoneNumber.text.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(" ", "");
      if (controllerCpfCnpj.text.isNotEmpty) userInfoUpdate.cpfCnpj = controllerCpfCnpj.text.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(" ", "");

      Get.rawSnackbar(
        messageText: Center(child: Text("Dados atualizados com sucesso!", style: TextStyle(color: kGreen, fontWeight: FontWeight.w700))),
        backgroundColor: HexColor("EFEFEF"),
      );

      updateMyUser(userInfoUpdate);
    } else {
      Get.rawSnackbar(
        messageText: Center(child: Text("CPF ou CNPJ Inválido", style: TextStyle(color: kRed, fontWeight: FontWeight.w700))),
        backgroundColor: HexColor("EFEFEF"),
      );
    }
  }

  void updateMyUser(UserModel user) async {
    userRepository.updateMyUser(user);
    getMyUser();
  }
}
