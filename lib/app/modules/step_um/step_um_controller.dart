import 'package:get/get.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class StepUmController extends GetxController {
  var ativadoBR = false;
  var ativadoES = false;
  var ativadoUS = false;
  var idioma;

  //Brasil
  void getAtivoBR() async{
    ativadoBR = true;
    ativadoES = false;
    ativadoUS = false;
    idioma = "Português";

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("idioma", idioma);

    update();
  }

  //Espanhol
  void getAtivoES() async {
    ativadoBR = false;
    ativadoES = true;
    ativadoUS = false;
    idioma = "Espanhol";

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("idioma", idioma);

    update();
  }

  //Ingles
  void getAtivoUS() async {
    ativadoBR = false;
    ativadoES = false;
    ativadoUS = true;
    idioma = "Inglês";

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("idioma", idioma);

    update();
  }

  void getAtivoAtual() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getString("idioma") == "Português"){
      getAtivoBR();
      Get.updateLocale(Locale ('pt', 'BR'));
    } else if(prefs.getString("idioma") == "Espanhol"){
      getAtivoES();
      Get.updateLocale(Locale ('es', 'ES'));
    } else if(prefs.getString("idioma") == "Inglês"){
      getAtivoUS();
      Get.updateLocale(Locale ('en', 'US'));
    } else{
      getAtivoBR();
      Get.updateLocale(Locale ('pt', 'BR'));
    }
    update();
  }

  @override
  void onInit() {
    getAtivoAtual();
    super.onInit();
  }
}