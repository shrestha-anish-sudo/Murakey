class CarouselItem {
  String? status;
  List<Data>? data;
  String? message;

  CarouselItem({this.status, this.data, this.message});

  CarouselItem.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? name;
  String? image;
  String? location;
  String? buyRate;
  String? rate;
  String? slug;
  String? duration;
  String? description;
  bool? isFeatured;
  String? status;
  String? inserted;
  String? updated;
  Category? category;
  SubCategory? subCategory;

  Data(
      {this.sId,
      this.name,
      this.image,
      this.location,
      this.buyRate,
      this.rate,
      this.slug,
      this.duration,
      this.description,
      this.isFeatured,
      this.status,
      this.inserted,
      this.updated,
      this.category,
      this.subCategory});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    buyRate = json['buyRate'];
    rate = json['rate'];
    slug = json['slug'];
    duration = json['duration'];
    description = json['description'];
    isFeatured = json['isFeatured'];
    status = json['status'];
    inserted = json['inserted'];
    updated = json['updated'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'] != null
        ? new SubCategory.fromJson(json['subCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['location'] = this.location;
    data['buyRate'] = this.buyRate;
    data['rate'] = this.rate;
    data['slug'] = this.slug;
    data['duration'] = this.duration;
    data['description'] = this.description;
    data['isFeatured'] = this.isFeatured;
    data['status'] = this.status;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.toJson();
    }
    return data;
  }
}

class Category {
  String? sId;
  String? slug;
  String? name;
  String? image;
  String? inserted;
  String? updated;

  Category(
      {this.sId,
      this.slug,
      this.name,
      this.image,
      this.inserted,
      this.updated});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    name = json['name'];
    image = json['image'];
    inserted = json['inserted'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['image'] = this.image;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    return data;
  }
}

class SubCategory {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? inserted;
  String? updated;
  Category? category;

  SubCategory(
      {this.sId,
      this.name,
      this.slug,
      this.image,
      this.inserted,
      this.updated,
      this.category});

  SubCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    inserted = json['inserted'];
    updated = json['updated'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['inserted'] = this.inserted;
    data['updated'] = this.updated;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}
