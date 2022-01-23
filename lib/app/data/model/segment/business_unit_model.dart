import 'package:renner_coatings/app/data/model/segment/segments_model.dart';

class BusinessUnit {
  List<Segments>? businessUnit;

  BusinessUnit({this.businessUnit});

  BusinessUnit.fromJson(List<dynamic> json) {
    businessUnit = json.map((e) => Segments.fromJson(e)).toList();
  }

  List<dynamic> toJson() {
    return businessUnit!;
  }
}
