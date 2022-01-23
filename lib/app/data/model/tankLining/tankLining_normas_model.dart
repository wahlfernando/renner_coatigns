class TankLiningNormasListModel {
  List<TankLiningNormasModel>? tankLiningNormasList;

  TankLiningNormasListModel({this.tankLiningNormasList});

  TankLiningNormasListModel.fromJson(List<dynamic> json) {
    tankLiningNormasList = json.map((e) => TankLiningNormasModel.fromJson(e)).toList();
  }

  List<TankLiningNormasModel>? toJson() {
    return tankLiningNormasList;
  }
}

class TankLiningNormasModel {
  String? descriptionTypecoating;
  List<String>? notes;

  TankLiningNormasModel({this.descriptionTypecoating, this.notes});

  TankLiningNormasModel.fromJson(Map<String, dynamic> json) {
    descriptionTypecoating = json['description_typecoating'] == null ? "" : json['description_typecoating'];
    notes = json['notes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description_typecoating'] = this.descriptionTypecoating;
    data['notes'] = this.notes;
    return data;
  }
}