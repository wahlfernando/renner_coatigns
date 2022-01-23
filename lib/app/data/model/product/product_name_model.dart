class ProductNameListModel {
  List<ProductNameModel>? productModelList;

  ProductNameListModel({this.productModelList});

  ProductNameListModel.fromJson(List<dynamic> json) {
    productModelList = json.map((e) => ProductNameModel.fromJson(e)).toList();
  }

  List<ProductNameModel>? toJson() {
    return productModelList;
  }
}

class ProductNameModel {
  String? productId;
  String? productName;
  bool? countrybr;
  bool? countrype;
  bool? countrych;

  ProductNameModel({this.productId, this.productName, this.countrybr, this.countrype, this.countrych});

  ProductNameModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    countrybr = json['countrybr'];
    countrype = json['countrype'];
    countrych = json['countrych'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['countrybr'] = this.countrybr;
    data['countrype'] = this.countrype;
    data['countrych'] = this.countrych;
    return data;
  }
}
