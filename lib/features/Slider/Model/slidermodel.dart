import 'package:flutter/src/widgets/basic.dart';

class CarouselItem {
  String? status;
  Data? data;
  String? message;

  CarouselItem({this.status, this.data, this.message});

  CarouselItem.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? sId;
  String? title;
  String? description;
  String? image;
  String? inserted;
  String? updated;

  Data(
      {this.sId,
      this.title,
      this.description,
      this.image,
      this.inserted,
      this.updated});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }

  map(Builder Function(dynamic data) param0) {}
}
