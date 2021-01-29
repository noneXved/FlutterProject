class TVJsonData {
  int id;
  String name;
  String imageUrl;
  Info info;
  List<TvProgram> tvProgram;

  TVJsonData({this.id, this.name, this.imageUrl, this.info, this.tvProgram});

  TVJsonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['tv_program'] != null) {
      tvProgram = new List<TvProgram>();
      json['tv_program'].forEach((v) {
        tvProgram.add(new TvProgram.fromJson(v));
      });
    }
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
      data['tv_program'] = this.tvProgram.map((v) => v.toJson()).toList();
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
  String hour;
  String movie;

  TvProgram({this.hour, this.movie});

  TvProgram.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    movie = json['movie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['movie'] = this.movie;
    return data;
  }
}
