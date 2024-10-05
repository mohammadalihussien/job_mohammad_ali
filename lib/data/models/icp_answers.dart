import 'package:job_offers_mohammad_ali/data/models/type_of_sales.dart';

import 'commission_offered.dart';
import 'job_roles.dart';

class IcpAnswers {
  List<JobRole>? jobRole;
  CommissionOffered? commissionOffered;
  bool? relocationAllowance;
  List<TypesOfSales>? typesOfSales;
  IcpAnswers(
      {this.jobRole,
        this.commissionOffered,
        this.relocationAllowance,this.typesOfSales});

  IcpAnswers.fromJson(Map<String, dynamic> json) {
    if (json['job-role'] != null) {
      jobRole = <JobRole>[];
      json['job-role'].forEach((v) {
        jobRole!.add(JobRole.fromJson(v));
      });
    }
    if(json['type-of-sales'] != null){
      typesOfSales = <TypesOfSales>[];
      json["type-of-sales"].forEach((v) {
        typesOfSales!.add(TypesOfSales.fromJson(v));
      });
      print(typesOfSales);
    }

    commissionOffered = json['commission-offered'] != null
        ? CommissionOffered.fromJson(json['commission-offered'])
        : null;
    relocationAllowance = json['relocation-allowance'];
  }
}