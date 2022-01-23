
class TankLiningIdCoatingsListModel {
  List<TankLiningIdCoatingsModel>? tankLiningCoatingsList;

  TankLiningIdCoatingsListModel({this.tankLiningCoatingsList});

  TankLiningIdCoatingsListModel.fromJson(List<dynamic> json) {
    tankLiningCoatingsList = json.map((e) => TankLiningIdCoatingsModel.fromJson(e)).toList();
  }

  List<TankLiningIdCoatingsModel>? toJson() {
    return tankLiningCoatingsList;
  }
}

class TankLiningIdCoatingsModel {
  String? idTypecoating;
  String? nameTypecoating;
  int? isRecommended;

  TankLiningIdCoatingsModel(
      {this.idTypecoating, this.nameTypecoating, this.isRecommended});

  TankLiningIdCoatingsModel.fromJson(Map<String, dynamic> json) {
    idTypecoating = json['id_typecoating'];
    nameTypecoating = json['name_typecoating'];
    isRecommended = json['isRecommended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_typecoating'] = this.idTypecoating;
    data['name_typecoating'] = this.nameTypecoating;
    data['isRecommended'] = this.isRecommended;
    return data;
  }
}