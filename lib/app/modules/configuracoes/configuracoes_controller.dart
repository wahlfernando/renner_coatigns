
import 'package:get/get.dart';
import 'package:renner_coatings/app/data/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesController extends GetxController{

  UserRepository userRepository = UserRepository();

  var ativadoBR = false;
  var ativadoES = false;
  var ativadoUS = false;
  var idioma;
  bool isSwitched = false;


  //TODO: por enquanto apaga apenas os dados do SharedPreferences
  void apagarConta()async{

    userRepository.deleteUser();

    SharedPreferences prefes = await SharedPreferences.getInstance();
    await prefes.clear();

  }

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

    final SharedPreferences prefs = await SharedPreferences.getInstance();;
    prefs.setString("idioma", idioma);

    update();
  }

  void buscaIdioma() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idioma = prefs.getString("idioma");

    if(idioma == "Português"){
      getAtivoBR();
    } else if(idioma == "Espanhol"){
      getAtivoES();
    } else if(idioma == "Inglês"){
      getAtivoUS();
    } else if(idioma.isEmpty || idioma == null){
      getAtivoBR();
    }
    update();
  }


  void updateSwitched(bool index) {
    isSwitched = index;
    update();
  }

  @override
  void onInit() {
    buscaIdioma();
    super.onInit();
  }



}