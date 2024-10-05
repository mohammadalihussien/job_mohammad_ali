class CompanyDetails {
  String? name;
  String? logo;
  String? industry;
  String? description;
  String? website;
  String? linkedin;
  String? twitter;

  CompanyDetails({this.name, this.logo});

  CompanyDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    industry = json['industry'];
    description = json['description'];
    website = json['website'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
  }

}