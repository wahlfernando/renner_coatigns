class UserModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? cpfCnpj;

  UserModel({this.name, this.email, this.phoneNumber, this.cpfCnpj});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    cpfCnpj = json['cpf_cnpj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['cpf_cnpj'] = this.cpfCnpj;
    return data;
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phoneNumber: $phoneNumber, cpfCnpj: $cpfCnpj)';
  }
}
