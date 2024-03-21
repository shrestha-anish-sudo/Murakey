class UserModel {
  String? status;
  String? token;
  Data? data;
  String? message;

  UserModel({this.status, this.token, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? fullName;
  Null? email;
  Null? image;
  Null? address;
  String? phoneNumber;
  bool? verified;
  bool? isBlocked;
  String? blockedMessage;
  String? inserted;
  String? updated;

  Data(
      {this.sId,
      this.fullName,
      this.email,
      this.image,
      this.address,
      this.phoneNumber,
      this.verified,
      this.isBlocked,
      this.blockedMessage,
      this.inserted,
      this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    fullName = json['fullName'];
    email = json['email'];
    image = json['image'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    verified = json['verified'];
    isBlocked = json['isBlocked'];
    blockedMessage = json['blockedMessage'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['image'] = this.image;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['verified'] = this.verified;
    data['isBlocked'] = this.isBlocked;
    data['blockedMessage'] = this.blockedMessage;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}
