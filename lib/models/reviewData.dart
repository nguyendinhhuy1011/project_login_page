class ReviewData {
  ReviewData({
    this.id,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.title,
    this.content,
    this.photos,
    this.status,
    this.isEnable,
    this.account,
    this.data,
    this.type,
    this.rating,
  });

  ReviewData.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    modifiedAt = json['modifiedAt'];
    modifiedBy = json['modifiedBy'];
    title = json['title'];
    content = json['content'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos?.add(v);
      });
    }
    status = json['status'];
    isEnable = json['isEnable'];
    account =
        json['account'] != null ? Account.fromJson(json['account']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    type = json['type'];
    rating = json['rating'];
  }

  int? id;
  String? createdAt;
  String? createdBy;
  String? modifiedAt;
  dynamic modifiedBy;
  String? title;
  String? content;
  List<dynamic>? photos;
  int? status;
  bool? isEnable;
  Account? account;
  Data? data;
  dynamic type;
  double? rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['createdBy'] = createdBy;
    map['modifiedAt'] = modifiedAt;
    map['modifiedBy'] = modifiedBy;
    map['title'] = title;
    map['content'] = content;
    if (photos != null) {
      map['photos'] = photos?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['isEnable'] = isEnable;
    if (account != null) {
      map['account'] = account?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['type'] = type;
    map['rating'] = rating;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.avatar,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  int? id;
  dynamic name;
  dynamic avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }
}

class Account {
  Account({
    this.id,
    this.name,
    this.avatar,
  });

  Account.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  int? id;
  String? name;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }
}
