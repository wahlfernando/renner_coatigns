class SegmentListModel {
  List<SegmentModel>? segmentListModel;

  SegmentListModel({this.segmentListModel});

  SegmentListModel.fromJson(List<dynamic> json) {
    segmentListModel = json.map((e) => SegmentModel.fromJson(e)).toList();
  }

  List<SegmentModel>? toJson() {
    return segmentListModel;
  }
}

class SegmentModel {
  String? segmentId;
  String? segment;
  bool? isNew;
  String? businessUnit;

  SegmentModel({this.segmentId, this.segment, this.isNew, this.businessUnit});

  SegmentModel.fromJson(Map<String, dynamic> json) {
    segmentId = json['segmentId'];
    segment = json['segment'];
    isNew = json['isNew'];
    businessUnit = json['businessUnit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['segmentId'] = this.segmentId;
    data['segment'] = this.segment;
    data['isNew'] = this.isNew;
    data['businessUnit'] = this.businessUnit;
    return data;
  }
}
