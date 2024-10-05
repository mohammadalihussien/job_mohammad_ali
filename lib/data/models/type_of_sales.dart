class TypesOfSales {
  int? id;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;

  TypesOfSales.fromJson(Map<String,dynamic> json){
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
  }
}