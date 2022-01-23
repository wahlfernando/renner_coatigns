class FispqsBtsModelList {
  List<FispqsBtsModel>? fispqsBtsModelList;

  FispqsBtsModelList({this.fispqsBtsModelList});

  FispqsBtsModelList.fromJson(List<dynamic> json) {
    fispqsBtsModelList = json.map((e) => FispqsBtsModel.fromJson(e)).toList();
  }

  List<FispqsBtsModel>? toJson() {
    return fispqsBtsModelList;
  }
}

class FispqsBtsModel {
  String? productId;
  String? productName;
  String? btLink;
  String? fispqsLink;

  FispqsBtsModel({this.productId, this.productName, this.btLink, this.fispqsLink});

  FispqsBtsModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    btLink = json['btLink'];
    fispqsLink = json['fispqsLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['btLink'] = this.btLink;
    data['fispqsLink'] = this.fispqsLink;
    return data;
  }
}
