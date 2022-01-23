import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/user/user_model.dart';
import 'package:renner_coatings/app/data/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  UserRepository userRepository = UserRepository();
  Rx<UserModel> user = UserModel().obs;

  final loading = true.obs;

  var tabIndex = 0;

  getMyUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("conexao_internet") == "sem_conexao"){
      user.value.name == "Visitante - Sem conexao";
    } else {
      user.value.name == "";
      user.value = await userRepository.getMyUser();
    }
    update();
  }

  void changeTabIndex(int index) {
    print(tabIndex);
    tabIndex = index;
    update();
  }

  @override
  void onInit() async {
    await getMyUser();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }


}