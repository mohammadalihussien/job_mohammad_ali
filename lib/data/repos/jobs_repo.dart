import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:job_offers_mohammad_ali/connection/network_helper.dart';
import 'package:job_offers_mohammad_ali/constants/application_endPoints.dart';
import 'package:job_offers_mohammad_ali/data/models/jobs.dart';

class JobsRepo {
  final networkHelper;
  JobsRepo({required this.networkHelper});
  Future<Jobs?> fetchJobs() async {
    try {
      Response? response =
          await networkHelper.get(ApplicationEndPoints.jobList);
      if (response!.statusCode == 200) {
        print(response.data);
        Jobs jobs = Jobs.fromJson(response.data);
        print(jobs.count);
        return jobs;
      }
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
