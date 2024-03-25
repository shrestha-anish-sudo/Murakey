class Featuredservices {
  String? _status;
  List<Data>? _data;
  String? _message;

  Featuredservices({String? status, List<Data>? data, String? message}) {
    if (status != null) {
      this._status = status;
    }
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
  }

  String? get status => _status;
  set status(String? status) => _status = status;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  Featuredservices.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this._message;
    return data;
  }
}

class Data {
  String? _sId;
  String? _name;
  String? _image;
  String? _location;
  String? _buyRate;
  String? _rate;
  String? _slug;
  String? _duration;
  String? _description;
  bool? _isFeatured;
  String? _status;
  String? _inserted;
  String? _updated;
  Category? _category;
  SubCategory? _subCategory;

  Data(
      {String? sId,
      String? name,
      String? image,
      String? location,
      String? buyRate,
      String? rate,
      String? slug,
      String? duration,
      String? description,
      bool? isFeatured,
      String? status,
      String? inserted,
      String? updated,
      Category? category,
      SubCategory? subCategory}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (location != null) {
      this._location = location;
    }
    if (buyRate != null) {
      this._buyRate = buyRate;
    }
    if (rate != null) {
      this._rate = rate;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (duration != null) {
      this._duration = duration;
    }
    if (description != null) {
      this._description = description;
    }
    if (isFeatured != null) {
      this._isFeatured = isFeatured;
    }
    if (status != null) {
      this._status = status;
    }
    if (inserted != null) {
      this._inserted = inserted;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (category != null) {
      this._category = category;
    }
    if (subCategory != null) {
      this._subCategory = subCategory;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get location => _location;
  set location(String? location) => _location = location;
  String? get buyRate => _buyRate;
  set buyRate(String? buyRate) => _buyRate = buyRate;
  String? get rate => _rate;
  set rate(String? rate) => _rate = rate;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
  String? get description => _description;
  set description(String? description) => _description = description;
  bool? get isFeatured => _isFeatured;
  set isFeatured(bool? isFeatured) => _isFeatured = isFeatured;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get inserted => _inserted;
  set inserted(String? inserted) => _inserted = inserted;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  Category? get category => _category;
  set category(Category? category) => _category = category;
  SubCategory? get subCategory => _subCategory;
  set subCategory(SubCategory? subCategory) => _subCategory = subCategory;

  Data.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
    _image = json['image'];
    _location = json['location'];
    _buyRate = json['buyRate'];
    _rate = json['rate'];
    _slug = json['slug'];
    _duration = json['duration'];
    _description = json['description'];
    _isFeatured = json['isFeatured'];
    _status = json['status'];
    _inserted = json['inserted'];
    _updated = json['updated'];
    _category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    _subCategory = json['subCategory'] != null
        ? new SubCategory.fromJson(json['subCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['name'] = this._name;
    data['image'] = this._image;
    data['location'] = this._location;
    data['buyRate'] = this._buyRate;
    data['rate'] = this._rate;
    data['slug'] = this._slug;
    data['duration'] = this._duration;
    data['description'] = this._description;
    data['isFeatured'] = this._isFeatured;
    data['status'] = this._status;
    data['inserted'] = this._inserted;
    data['updated'] = this._updated;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    if (this._subCategory != null) {
      data['subCategory'] = this._subCategory!.toJson();
    }
    return data;
  }
}

class Category {
  String? _sId;
  String? _slug;
  String? _name;
  String? _image;
  String? _inserted;
  String? _updated;

  Category(
      {String? sId,
      String? slug,
      String? name,
      String? image,
      String? inserted,
      String? updated}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (name != null) {
      this._name = name;
    }
    if (image != null) {
      this._image = image;
    }
    if (inserted != null) {
      this._inserted = inserted;
    }
    if (updated != null) {
      this._updated = updated;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get inserted => _inserted;
  set inserted(String? inserted) => _inserted = inserted;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;

  Category.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _slug = json['slug'];
    _name = json['name'];
    _image = json['image'];
    _inserted = json['inserted'];
    _updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['slug'] = this._slug;
    data['name'] = this._name;
    data['image'] = this._image;
    data['inserted'] = this._inserted;
    data['updated'] = this._updated;
    return data;
  }
}

class SubCategory {
  String? _sId;
  String? _name;
  String? _slug;
  String? _image;
  String? _inserted;
  String? _updated;
  Category? _category;

  SubCategory(
      {String? sId,
      String? name,
      String? slug,
      String? image,
      String? inserted,
      String? updated,
      Category? category}) {
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
    if (slug != null) {
      this._slug = slug;
    }
    if (image != null) {
      this._image = image;
    }
    if (inserted != null) {
      this._inserted = inserted;
    }
    if (updated != null) {
      this._updated = updated;
    }
    if (category != null) {
      this._category = category;
    }
  }

  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get inserted => _inserted;
  set inserted(String? inserted) => _inserted = inserted;
  String? get updated => _updated;
  set updated(String? updated) => _updated = updated;
  Category? get category => _category;
  set category(Category? category) => _category = category;

  SubCategory.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _inserted = json['inserted'];
    _updated = json['updated'];
    _category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this._sId;
    data['name'] = this._name;
    data['slug'] = this._slug;
    data['image'] = this._image;
    data['inserted'] = this._inserted;
    data['updated'] = this._updated;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    return data;
  }
}
