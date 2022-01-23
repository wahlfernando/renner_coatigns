class Segment {
  String? segmentId;
  String? segment;
  bool? isNew;
  String? businessUnitId;
  String? businessUnit;
  String? iconUrl;

  Segment({this.segmentId, this.segment, this.isNew, this.businessUnitId, this.businessUnit, this.iconUrl});

  Segment.fromJson(Map<String, dynamic> json) {
    segmentId = json['segmentId'];
    segment = json['segment'];
    isNew = json['isNew'];
    businessUnitId = json['businessUnitId'];
    businessUnit = json['businessUnit'];
    iconUrl = json['iconUrl'];
  }

  Map<String, dynamic> toJson() {
    return {'segmentId': segmentId, 'segment': segment, 'isNew': isNew, "businessUnitId": businessUnitId, 'businessUnit': businessUnit, 'iconUrl': iconUrl};
  }
}
