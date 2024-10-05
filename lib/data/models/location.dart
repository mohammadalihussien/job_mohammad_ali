class Location {
  int? id;
  String? nameAr;
  String? nameEn;
  int? listOrder;

  Location({this.id, this.nameAr, this.nameEn, this.listOrder});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    listOrder = json['list_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['list_order'] = this.listOrder;
    return data;
  }
}