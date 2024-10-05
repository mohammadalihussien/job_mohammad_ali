import 'package:job_offers_mohammad_ali/data/models/type_of_sales.dart';

import 'job_roles.dart';

class Tags {
  List<JobRole>? jobRole;
  List<TypesOfSales>? typesOfSales;
  Tags({this.jobRole});

  Tags.fromJson(Map<String, dynamic> json) {
    if (json['job-role'] != null) {
      jobRole = <JobRole>[];
      json['job-role'].forEach((v) { jobRole!.add(new JobRole.fromJson(v)); });
    }
    if (json['type-of-sales'] != null) {
      typesOfSales = <TypesOfSales>[];
      json['type-of-sales'].forEach((v) { typesOfSales!.add(new TypesOfSales.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobRole != null) {
      data['job-role'] = this.jobRole!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
