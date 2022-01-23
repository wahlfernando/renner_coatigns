import 'package:get/get.dart';

class CadastroUserController extends GetxController {
  bool isObscureTextSenha = true;
  bool isObscureTextConfirmaSenha = true;
  bool valueCheckBoxTerms = false;
  bool valueCheckBoxPolicy = false;
  String resultErros = "";

  void obscureTextUpdate() {
    if (isObscureTextSenha) {
      isObscureTextSenha = false;
    } else if (!isObscureTextSenha) {
      isObscureTextSenha = true;
    }
    update();
  }

  void obscureTextConfirmaSenhaUpdate() {
    if (isObscureTextConfirmaSenha) {
      isObscureTextConfirmaSenha = false;
    } else if (!isObscureTextConfirmaSenha) {
      isObscureTextConfirmaSenha = true;
    }
    update();
  }

  void valueCheckBoxPolicyChanged() {
    valueCheckBoxPolicy = true;
    update();
  }

  void valueCheckBoxPolicyDesmarcaMarca() {
    if (valueCheckBoxPolicy = true) {
      valueCheckBoxPolicy = false;
    } else {
      valueCheckBoxPolicy = true;
    }
    update();
  }

  void valueCheckBoxTermsChanged() {
    if (valueCheckBoxTerms) {
      valueCheckBoxTerms = false;
    } else if (!valueCheckBoxTerms) {
      valueCheckBoxTerms = true;
    }
    update();
  }

  validaCampos(String str, String contrtoller) {
    if (str.length > 0) {
      if (contrtoller == "nome") {
        return "Nome não pode ser nulo.";
      }
      if (contrtoller == "email") {
        return "E-mail não pode ser nulo.";
      }
      if (contrtoller == "senha") {
        return "Senha não pode ser nulo.";
      }
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    valueCheckBoxTerms = false;
  }
}
