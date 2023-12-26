class UserModel {
  String? sId;
  String? name;
  String? email;
  String? dob;
  String? occupation;
  String? bloodGroup;
  Address? address;
  bool? isWeight50kg;
  String? lastDonation;
  String? pic;
  String? accessToken;

  UserModel(
      {this.sId,
        this.name,
        this.email,
        this.dob,
        this.occupation,
        this.bloodGroup,
        this.address,
        this.isWeight50kg,
        this.lastDonation,
        this.pic,
        this.accessToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    occupation = json['occupation'];
    bloodGroup = json['blood_group'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    isWeight50kg = json['is_weight_50kg'];
    lastDonation = json['last_donation'];
    pic = json['pic'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['occupation'] = this.occupation;
    data['blood_group'] = this.bloodGroup;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['is_weight_50kg'] = this.isWeight50kg;
    data['last_donation'] = this.lastDonation;
    data['pic'] = this.pic;
    data['access_token'] = this.accessToken;
    return data;
  }
}

class Address {
  int? divisionId;
  int? districtId;
  int? areaId;
  String? postOffice;
  String? sId;

  Address(
      {this.divisionId,
        this.districtId,
        this.areaId,
        this.postOffice,
        this.sId});

  Address.fromJson(Map<String, dynamic> json) {
    divisionId = json['division_id'];
    districtId = json['district_id'];
    areaId = json['area_id'];
    postOffice = json['post_office'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['division_id'] = this.divisionId;
    data['district_id'] = this.districtId;
    data['area_id'] = this.areaId;
    data['post_office'] = this.postOffice;
    data['_id'] = this.sId;
    return data;
  }
}