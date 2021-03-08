class Post {
  int currentCount;
  List<Data> data;
  int matchCount;
  int page;
  int perPage;
  int totalCount;

  Post(
      {this.currentCount,
      this.data,
      this.matchCount,
      this.page,
      this.perPage,
      this.totalCount});

  Post.fromJson(Map<String, dynamic> json) {
    currentCount = json['currentCount'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    matchCount = json['matchCount'];
    page = json['page'];
    perPage = json['perPage'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentCount'] = this.currentCount;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['matchCount'] = this.matchCount;
    data['page'] = this.page;
    data['perPage'] = this.perPage;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Data {
  String address;
  String centerName;
  String centerType;
  String facilityName;
  int id;
  String lat;
  String lng;
  String org;
  String sido;
  String sigungu;
  String zipCode;

  Data(
      {this.address,
      this.centerName,
      this.centerType,
      this.facilityName,
      this.id,
      this.lat,
      this.lng,
      this.org,
      this.sido,
      this.sigungu,
      this.zipCode});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    centerName = json['centerName'];
    centerType = json['centerType'];
    facilityName = json['facilityName'];
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    org = json['org'];
    sido = json['sido'];
    sigungu = json['sigungu'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['centerName'] = this.centerName;
    data['centerType'] = this.centerType;
    data['facilityName'] = this.facilityName;
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['org'] = this.org;
    data['sido'] = this.sido;
    data['sigungu'] = this.sigungu;
    data['zipCode'] = this.zipCode;
    return data;
  }
}
