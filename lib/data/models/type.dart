class Type {
  int? id;
  String? nameAr;
  String? nameEn;
  int? order;

  Type({this.id, this.nameAr, this.nameEn, this.order});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['order'] = this.order;
    return data;
  }
}