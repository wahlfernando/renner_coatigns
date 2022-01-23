import 'package:renner_coatings/app/data/model/segment/business_unit_model.dart';

class BusinessUnits {
  List<BusinessUnit>? businessUnit;

  BusinessUnits.fromJson(List<dynamic> json) {
    businessUnit = json.map((e) => BusinessUnit.fromJson(e)).toList();
  }

  List<dynamic> toJson() {
    return businessUnit!;
  }
}
