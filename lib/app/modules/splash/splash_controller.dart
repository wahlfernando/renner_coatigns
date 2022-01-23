import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:renner_coatings/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class SplashController extends GetxController {

  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late BuildContext context;
  double? lati;
  double? long;
  String? idioma;

  @override
  void onReady() {
    super.onReady();
    getIdioma();
    loading();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void kmcalc() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Location location = new Location();
    var minhaLocalizacao;

    minhaLocalizacao = await location.getLocation();
    prefs.setDouble("lati", minhaLocalizacao.latitude);
    prefs.setDouble("long", minhaLocalizacao.longitude);

  }

  getIdioma() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idioma = prefs.getString("idioma");

    if(idioma == "Português"){
      var locale = Locale('pt', 'BR');
      Get.updateLocale(locale);
    } else if(idioma == "Espanhol"){
      var locale = Locale('es', 'ES');
      Get.updateLocale(locale);
    } else if(idioma == "Inglês"){
      var locale = Locale('en', 'US');
      Get.updateLocale(locale);
    } else if(idioma!.isEmpty || idioma == null){
      var locale = Locale('pt', 'BR');
      Get.updateLocale(locale);
    }

  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _connectionStatus = result;
    if (result == ConnectivityResult.mobile) {
      prefs.setString("conexao_internet", "mobile");
    } else if (result == ConnectivityResult.wifi){
      prefs.setString("conexao_internet", "wifi");
    } else {
      prefs.setString("conexao_internet", "sem_conexao");
    }
  }

  Future<void> loading() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Timer(Duration(seconds: 2), () {
      kmcalc();

      print(prefs.getString("token"));

      if(prefs.getString("token") == null || prefs.getString("token") == "" || prefs.getString("token")!.isEmpty){
        if(prefs.getString("primeiro_acesso") == "acessou"){
          Get.offAndToNamed(Routes.LOGIN);
        } else{
          Get.offAndToNamed(Routes.STEPUM);
        }
      } else{
        Get.offAndToNamed(Routes.HOME);
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
