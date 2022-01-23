class BusinessUnitListModel {
  List<BusinessUnitModel>? businessUnitModel;

  BusinessUnitListModel({this.businessUnitModel});

  BusinessUnitListModel.fromJson(List<dynamic> json) {
    businessUnitModel = json.map((e) => BusinessUnitModel.fromJson(e)).toList();
  }

  List<BusinessUnitModel>? toJson() {
    return businessUnitModel;
  }
}

class BusinessUnitModel {
  String? businessUnitId;
  String? businessUnit;

  BusinessUnitModel({this.businessUnitId, this.businessUnit});

  BusinessUnitModel.fromJson(Map<String, dynamic> json) {
    businessUnitId = json['businessUnitId'];
    businessUnit = json['businessUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessUnitId'] = this.businessUnitId;
    data['businessUnit'] = this.businessUnit;
    return data;
  }
}
