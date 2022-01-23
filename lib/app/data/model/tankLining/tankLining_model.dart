class TankLiningListModel {
  List<TankLiningModel>? tankLiningList;

  TankLiningListModel({this.tankLiningList});

  TankLiningListModel.fromJson(List<dynamic> json) {
    tankLiningList = json.map((e) => TankLiningModel.fromJson(e)).toList();
  }

  List<TankLiningModel>? toJson() {
    return tankLiningList;
  }
}

class TankLiningModel {
  String? idTanklining;
  String? nameProduct;

  TankLiningModel({this.idTanklining, this.nameProduct});

  TankLiningModel.fromJson(Map<String, dynamic> json) {
    idTanklining = json['id_tanklining'];
    nameProduct = json['name_product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanklining'] = this.idTanklining;
    data['name_product'] = this.nameProduct;
    return data;
  }
}
