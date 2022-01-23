import 'package:get/get.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_id_coatings_model.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_model.dart';
import 'package:renner_coatings/app/data/model/tankLining/tankLining_normas_model.dart';
import 'package:renner_coatings/app/data/repository/tankLining/tankLining_repository.dart';

class TankLiningController extends GetxController {
  List<TankLiningModel>? tankLiningModel;
  List<TankLiningIdCoatingsModel>? tankLiningCoatingsModel;
  TankLiningNormasModel? tankLiningNormasModel;

  String? nametittulo;
  String? idtypecoating;


  final loading = true;
  TankLiningRepository tankLiningRepository = TankLiningRepository();

  void getDados(String inicio, String fim) async {
    loading == true;
    var result = await tankLiningRepository.getTankLining(inicio, fim);
    tankLiningModel = result.tankLiningList;

    if (tankLiningModel == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

  void getTankAgentsResult(String idTanklining) async {
    tankLiningCoatingsModel = null;
    loading == true;
    var result = await tankLiningRepository.getCoatingsIdTankLining(idTanklining);
    tankLiningCoatingsModel = result.tankLiningCoatingsList;

    if (tankLiningCoatingsModel == null) {
    loading == true;
    } else {
    loading == false;
    }
    update();
  }

  Future<void> getTankAgentsNormas({required String? idtanklining, required String? idtypecoating}) async {

    loading == true;
    var result = await tankLiningRepository.getNormasTankLining(idtanklining!, idtypecoating!);
    tankLiningNormasModel = result;

    if (tankLiningNormasModel == null) {
      loading == true;
    } else {
      loading == false;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
