class TechnologyListModel {
  List<TechnologyModel>? technologyListModel;

  TechnologyListModel({this.technologyListModel});

  TechnologyListModel.fromJson(List<dynamic> json) {
    technologyListModel = json.map((e) => TechnologyModel.fromJson(e)).toList();
  }

  List<TechnologyModel>? toJson() {
    return technologyListModel;
  }
}

class TechnologyModel {
  String? technologyId;
  String? technology;

  TechnologyModel({this.technologyId, this.technology});

  TechnologyModel.fromJson(Map<String, dynamic> json) {
    technologyId = json['technologyId'];
    technology = json['technology'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['technologyId'] = this.technologyId;
    data['technology'] = this.technology;
    return data;
  }
}
