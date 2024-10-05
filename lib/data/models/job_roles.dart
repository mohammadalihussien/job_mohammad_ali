class JobRole {
  int? id;
  String? titleAr;
  String? titleEn;
  List<String>? nextQuestion;
  String? descriptionAr;
  String? descriptionEn;

  JobRole(
      {this.id,
        this.titleAr,
        this.titleEn,
        this.nextQuestion,
        this.descriptionAr,
        this.descriptionEn});

  JobRole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    nextQuestion = json['next_question'].cast<String>();
    descriptionAr = json['description_ar'];
    descriptionEn = json['description_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['next_question'] = this.nextQuestion;
    data['description_ar'] = this.descriptionAr;
    data['description_en'] = this.descriptionEn;
    return data;
  }
}