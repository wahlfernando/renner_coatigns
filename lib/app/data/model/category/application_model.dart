class ApplicationListModel {
  List<ApplicationModel>? applicationListModel;

  ApplicationListModel({this.applicationListModel});

  ApplicationListModel.fromJson(List<dynamic> json) {
    applicationListModel = json.map((e) => ApplicationModel.fromJson(e)).toList();
  }

  List<ApplicationModel>? toJson() {
    return applicationListModel;
  }
}

class ApplicationModel {
  String? applicationId;
  String? application;

  ApplicationModel({this.applicationId, this.application});

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    applicationId = json['applicationId'];
    application = json['application'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['applicationId'] = this.applicationId;
    data['application'] = this.application;
    return data;
    //
  }
}
