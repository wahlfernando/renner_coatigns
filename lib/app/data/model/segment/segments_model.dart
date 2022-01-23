import 'package:renner_coatings/app/data/model/segment/segment_model.dart';

class Segments {
  List<Segment>? segments;

  Segments.fromJson(List<dynamic> json) {
    segments = json.map((e) => Segment.fromJson(e)).toList();
  }

  List<dynamic> toJson() {
    return segments!;
  }
}
