class Ops {
  String? insert;

  Ops({this.insert});

  Ops.fromJson(Map<String, dynamic> json) {
    insert = json['insert'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insert'] = this.insert;
    return data;
  }
}
