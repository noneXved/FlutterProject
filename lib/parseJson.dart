class TVJsonData {
  int id;
  String name;
  String imageUrl;
  Info info;
  TvProgram tvProgram;

  TVJsonData({this.id, this.name, this.imageUrl, this.info, this.tvProgram});

  TVJsonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    tvProgram = json['tv_program'] != null
        ? new TvProgram.fromJson(json['tv_program'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    if (this.tvProgram != null) {
      data['tv_program'] = this.tvProgram.toJson();
    }
    return data;
  }
}

class Info {
  String shortInfo;
  String longInfo;

  Info({this.shortInfo, this.longInfo});

  Info.fromJson(Map<String, dynamic> json) {
    shortInfo = json['short_info'];
    longInfo = json['long_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_info'] = this.shortInfo;
    data['long_info'] = this.longInfo;
    return data;
  }
}

class TvProgram {
  String film1;
  String film2;
  String film3;
  String film4;
  String film5;

  TvProgram({this.film1, this.film2, this.film3, this.film4, this.film5});

  TvProgram.fromJson(Map<String, dynamic> json) {
    film1 = json['film1'];
    film2 = json['film2'];
    film3 = json['film3'];
    film4 = json['film4'];
    film5 = json['film5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['film1'] = this.film1;
    data['film2'] = this.film2;
    data['film3'] = this.film3;
    data['film4'] = this.film4;
    data['film5'] = this.film5;
    return data;
  }
}
