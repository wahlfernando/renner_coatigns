class ProductNameSegmentListModel {
  List<ProductNameSegmentModel>? productModelList;

  ProductNameSegmentListModel({this.productModelList});

  ProductNameSegmentListModel.fromJson(List<dynamic> json) {
    productModelList = json.map((e) => ProductNameSegmentModel.fromJson(e)).toList();
  }

  List<ProductNameSegmentModel>? toJson() {
    return productModelList;
  }
}

class ProductNameSegmentModel {
  String? productId;
  String? productName;
  bool? countrybr;
  bool? countrype;
  bool? countrych;
  bool? isNorm;

  ProductNameSegmentModel({this.productId, this.productName, this.countrybr, this.countrype, this.countrych, this.isNorm});

  ProductNameSegmentModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    countrybr = json['countrybr'];
    countrype = json['countrype'];
    countrych = json['countrych'];
    isNorm = json['isNorm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['countrybr'] = this.countrybr;
    data['countrype'] = this.countrype;
    data['countrych'] = this.countrych;
    data['isNorm'] = this.isNorm;
    return data;
  }
}
