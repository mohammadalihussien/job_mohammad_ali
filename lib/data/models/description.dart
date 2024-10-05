
import 'package:job_offers_mohammad_ali/data/models/ops.dart';

class Description {
  List<Ops>? ops;

  Description({this.ops});

  Description.fromJson(Map<String, dynamic> json) {
    if (json['ops'] != null) {
      ops = <Ops>[];
      json['ops'].forEach((v) { ops!.add(new Ops.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ops != null) {
      data['ops'] = this.ops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
