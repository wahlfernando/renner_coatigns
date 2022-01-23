class Register {
  String? name;
  String? email;
  String? password;
  bool? privacyPolicy;
  bool? termsUse;

  Register(
      {this.name,
        this.email,
        this.password,
        this.privacyPolicy,
        this.termsUse});

  Register.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    privacyPolicy = json['privacy_policy'];
    termsUse = json['terms_use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['privacy_policy'] = this.privacyPolicy;
    data['terms_use'] = this.termsUse;
    return data;
  }
}