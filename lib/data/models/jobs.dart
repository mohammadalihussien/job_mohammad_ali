import 'package:job_offers_mohammad_ali/data/models/status.dart';
import 'company.dart';
import 'filters.dart';
import 'icp_answers.dart';
import 'job.dart';
import 'location.dart';
import 'type.dart';
class Jobs {
  List<Data>? data;
  int? count;
  String? nextLink;
  String? prevLink;

  Jobs({this.data, this.count, this.nextLink, this.prevLink});

  Jobs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    count = json['count'];
    nextLink = json['next_link'];
    prevLink = json['prev_link'];
  }
}

class Data {
  Job? job;

  Data({this.job});

  Data.fromJson(Map<String, dynamic> json) {
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
  }
}



















