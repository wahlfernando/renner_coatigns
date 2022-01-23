class FaqModelList {
  List<FaqModel>? faqModelList;

  FaqModelList({this.faqModelList});

  FaqModelList.fromJson(List<dynamic> json) {
    faqModelList = json.map((e) => FaqModel.fromJson(e)).toList();
  }

  List<FaqModel>? toJson() {
    return faqModelList;
  }
}

class FaqModel {
  String? title;
  String? answer;
  String? link;

  FaqModel({this.title, this.answer, this.link});

  FaqModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    answer = json['answer'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['answer'] = this.answer;
    data['link'] = this.link;
    return data;
  }
}
