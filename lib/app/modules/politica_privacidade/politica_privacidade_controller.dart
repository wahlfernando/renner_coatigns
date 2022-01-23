import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PoliticaPrivacidadeController extends GetxController {



  bool enableButton = false;
  ScrollController scrollController = ScrollController();
  bool btAceitarTermos = true;

  void finalPagina(){
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        enableButton = true;
        update();
      }
    });
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }



}