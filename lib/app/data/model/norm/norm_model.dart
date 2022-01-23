class NormListModel {
  List<NormModel>? normModelList;

  NormListModel({this.normModelList});

  NormListModel.fromJson(List<dynamic> json) {
    normModelList = json.map((e) => NormModel.fromJson(e)).toList();
  }

  List<NormModel>? toJson() {
    return normModelList;
  }
}

class NormModel {
  String? normIssuerId;
  String? normIssuer;
  String? normId;
  String? norm;
  String? productId;
  String? productName;

  NormModel({this.normIssuerId, this.normIssuer, this.norm, this.normId, this.productId, this.productName});

  NormModel.fromJson(Map<String, dynamic> json) {
    normIssuerId = json['normIssuerId'];
    normIssuer = json['normIssuer'];
    normId = json['normId'];
    norm = json['norm'];
    productId = json['productId'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['normIssuerId'] = this.normIssuerId;
    data['normIssuer'] = this.normIssuer;
    data['normId'] = this.normId;
    data['norm'] = this.norm;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    return data;
  }
}
