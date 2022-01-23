class LoginModel {
  String? name;
  String? token;
  String? expiration;

  LoginModel({this.name, this.token, this.expiration});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    return data;
  }
}
