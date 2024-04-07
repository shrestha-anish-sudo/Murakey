class Gallerymodel {
  String? status;
  List<Data>? data;
  String? message;

  Gallerymodel({this.status, this.data, this.message});

  Gallerymodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? iId;
  String? image;
  String? inserted;
  String? updated;

  Data({this.iId, this.image, this.inserted, this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    image = json['image'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['image'] = this.image;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}
