import 'package:renner_coatings/app/data/model/norm/norm_model.dart';

class ProductModel {
  String? productId;
  String? productCod;
  String? productName;
  String? description;
  List<NormModel>? norms = <NormModel>[];
  List<dynamic>? bts = <dynamic>[];
  List<dynamic>? fispqs = <dynamic>[];
  bool? countrybr;
  bool? countrype;
  bool? countrych;

  ProductModel({this.productId, this.productCod, this.productName, this.description, this.countrybr, this.countrype, this.countrych});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productCod = json['productCod'];
    productName = json['productName'];
    description = json['description'];
    // if (json['norms'] != null) {
    //   json['norms'].forEach((v) {
    //     norms!.add(NormModel.fromJson(v));
    //   });
    // }

    norms = json['norms'] == null ? null : (json['norms'] as List<dynamic>).map((e) => NormModel.fromJson(e)).toList();

    bts = json['bts'] == null ? null : json['bts'];
    fispqs = json['fispqs'] == null ? null : json['fispqs'];

    countrybr = json['countrybr'];
    countrype = json['countrype'];
    countrych = json['countrych'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productCod'] = this.productCod;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['norms'] = this.norms!.map((v) => v.toJson()).toList();
    data['bts'] = this.bts;
    data['fispqs'] = this.fispqs;
    data['countrybr'] = this.countrybr;
    data['countrype'] = this.countrype;
    data['countrych'] = this.countrych;
    return data;
  }
}
