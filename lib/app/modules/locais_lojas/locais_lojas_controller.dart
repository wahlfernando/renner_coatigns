import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/locais_lojas/locais_lojas_model.dart';
import 'package:renner_coatings/app/data/repository/locais_lojas/locais_lojas_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LocaisLojasController extends GetxController {

  var loading;
  var distancia;
  List<LocaisLojasModel>? locaisLojasModel;
  LocaislojasRepository locaislojasRepository = LocaislojasRepository();

  TextEditingController textController = TextEditingController();

  bool? mudaCorFab = false;
  bool? mudaCorDistr = false;
  bool? mudaCorRepre = false;
  bool? mudaCorReve = false;
  bool? mudaCorFili = false;


  @override
  void onInit() {
    getDados();
    super.onInit();
  }



  void controlaCoresBotoes(){
    mudaCorFab = true;
    mudaCorDistr = false;
    mudaCorRepre = false;
    mudaCorReve = false;
    mudaCorFili = false;
  }


  void getDados() async {
    var result = await locaislojasRepository.getStores();
    locaisLojasModel = result.locaisLojasList;
    // controlaCoresBotoes();
    update();
  }

  void getStoresByType(String tipo) async {
    var result = await locaislojasRepository.getStoresByType(tipo);
    locaisLojasModel = result.locaisLojasList;
    // controlaCoresBotoes();
    update();
  }

  void getStoresByName(String nome) async {
    var result = await locaislojasRepository.getStoresByName(nome);
    locaisLojasModel = result.locaisLojasList;
    // controlaCoresBotoes();
    update();
  }


  void distanciaKm(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    final double distance = await Geolocator.distanceBetween(
        prefs.getDouble("lati")!,
        prefs.getDouble("long")!,
        locaisLojasModel![index].latitude!,
        locaisLojasModel![index].longitude!
    );

    double distanceInKiloMeters = distance / 1000;
    int distanceInKM = distanceInKiloMeters.toInt();
    locaisLojasModel![index].km = distanceInKM.toInt();

    update();
  }

  void launchGoogleMaps(double? lat, double? long) async {
    var url = 'google.navigation:q=${lat.toString()},${long.toString()}';
    var fallbackUrl =
        'https://www.google.com/maps/search/?api=1&query=${lat.toString()},${long.toString()}';
    try {
      bool launched =
      await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  void launchWaze(double? lat, double? long) async {
    var url = 'waze://?ll=${lat.toString()},${long.toString()}';
    var fallbackUrl =
        'https://waze.com/ul?ll=${lat.toString()},${long.toString()}&navigate=yes';
    try {
      bool launched =
      await launch(url, forceSafariVC: false, forceWebView: false);
      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

}
