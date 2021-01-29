class TVJsonData {
  int id;
  String name;
  String imageUrl;
  Info info;
  List<String> tvProgram;

  TVJsonData({this.id, this.name, this.imageUrl, this.info, this.tvProgram});

  TVJsonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    tvProgram = json['tv_program'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    if (this.info != null) {
      data['info'] = this.info.toJson();
    }
    data['tv_program'] = this.tvProgram;
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