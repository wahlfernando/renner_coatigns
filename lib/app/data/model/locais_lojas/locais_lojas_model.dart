class LocaisLojasListModel {
  List<LocaisLojasModel>? locaisLojasList;

  LocaisLojasListModel({this.locaisLojasList});

  LocaisLojasListModel.fromJson(List<dynamic> json) {
    locaisLojasList = json.map((e) => LocaisLojasModel.fromJson(e)).toList();
  }

  List<LocaisLojasModel>? toJson() {
    return locaisLojasList;
  }
}

class LocaisLojasModel {
  String? idStores;
  String? name;
  String? country;
  String? state;
  String? city;
  String? district;
  String? address;
  String? numberAddress;
  String? phoneNumber;
  String? type;
  double? latitude;
  double? longitude;
  int? km;


  LocaisLojasModel(
      {this.idStores,
        this.name,
        this.country,
        this.state,
        this.city,
        this.district,
        this.address,
        this.numberAddress,
        this.phoneNumber,
        this.type,
        this.latitude,
        this.longitude,
        this.km});

  LocaisLojasModel.fromJson(Map<String, dynamic> json) {
    idStores = json['id_stores'] == null ? "" : json['id_stores'];
    name = json['name'] == null ? "" : json['name'];
    country = json['country'] == null ? "" : json['country'];
    state = json['state'] == null ? "" : json['state'];
    city = json['city'] == null ? "" : json['city'];
    district = json['district'] == null ? "" : json['district'];
    address = json['address'] == null ? "" : json['address'];
    numberAddress = json['number_address'] == null ? "" : json['number_address'];
    phoneNumber = json['phone_number'] == null ? "" : json['phone_number'];
    type = json['type'] == null ? "" : json['type'];
    latitude = json['latitude'] == null ? "" : json['latitude'];
    longitude = json['longitude'] == null ? "" : json['longitude'];
    km = json['km'] == null ? 0 : json['km'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_stores'] = this.idStores;
    data['name'] = this.name;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['district'] = this.district;
    data['address'] = this.address;
    data['number_address'] = this.numberAddress;
    data['phone_number'] = this.phoneNumber;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['km'] = this.km;
    return data;
  }
}