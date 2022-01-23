import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/core/global_widgets/hexcolor.dart';
import 'package:renner_coatings/app/core/global_widgets/panel_up/controller/panel_up_repository.dart';
import 'package:renner_coatings/app/core/theme/colors.dart';
import 'package:renner_coatings/app/data/model/user/user_model.dart';
import 'package:renner_coatings/app/data/repository/user/user_repository.dart';

class PanelUpController extends GetxController {
  PanelUpRepository panelUpRepository = PanelUpRepository();
  UserRepository userRepository = UserRepository();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerQuestion = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    UserModel user = await userRepository.getMyUser();
    controllerName.text = user.name ?? "";
    controllerEmail.text = user.email ?? "";
  }

  sendQuestion() async {
    var response = await panelUpRepository.sendQuestion(name: controllerName.text, email: controllerEmail.text, question: controllerQuestion.text);
    print(response[1]);
    response[0] == 200 ? showSnackBar("Mensagem enviada com sucesso!", kGreen) : showSnackBar("Erro ao enviar mensagem, tente novamente mais tarde", kRed);
  }

  showSnackBar(String text, Color colorText) {
    Get.rawSnackbar(
        messageText: Center(child: Text(text, style: TextStyle(color: colorText, fontWeight: FontWeight.w700))),
        backgroundColor: HexColor("EFEFEF"),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        duration: Duration(seconds: 3));
  }
}
