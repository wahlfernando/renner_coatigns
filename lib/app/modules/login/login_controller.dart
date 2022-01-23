import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {

  int which = 0;
  bool isObscureTextSenha = true;
  String? email;
  bool loading = false;
  String? conexao;

  void obscureTextUpdate(){
    if(isObscureTextSenha){
      isObscureTextSenha = false;
    } else if(!isObscureTextSenha){
      isObscureTextSenha = true;
    }
    update();
  }

  void ver_primeiro_acesso() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("primeiro_acesso", "acessou");
  }

  void conexaoInternet() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    conexao = prefs.get("conexao_internet").toString();
    print(conexao);

  }

  void verificaLogin() async{
    var prefs = await SharedPreferences.getInstance();
    if(prefs.getString("cad_email") != null){
      email = prefs.getString("cad_email");
    } else{
      if(prefs.getString("email") != null){
        email = prefs.getString("email");
      } else {
        email = "";
      }
    }
    update();
  }


  @override
  void onInit() {
    ver_primeiro_acesso();
    conexaoInternet();
    super.onInit();
    update();
  }


}