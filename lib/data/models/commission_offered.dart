class CommissionOffered {
  int? id;
  String? titleAr;
  String? titleEn;
  String? nameAr;
  String? nameEn;

  CommissionOffered(
      {this.id, this.titleAr, this.titleEn, this.nameAr, this.nameEn});

  CommissionOffered.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    return data;
  }
}