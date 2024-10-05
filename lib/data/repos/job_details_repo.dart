import 'package:dio/dio.dart';
import 'package:job_offers_mohammad_ali/connection/network_helper.dart';
import 'package:job_offers_mohammad_ali/constants/application_endPoints.dart';
import 'package:job_offers_mohammad_ali/data/models/job.dart';
import 'package:job_offers_mohammad_ali/data/models/job_details.dart';

class JobDetailsRepo {
  NetworkHelper networkHelper = NetworkHelper();
  
  Future<JobDetails?> getJobDetails (String uuid) async {
    try {
      Response? response = await networkHelper.get(ApplicationEndPoints.jobList+"/$uuid");
      if(response!.statusCode == 200){
        JobDetails job = JobDetails.fromJson(response.data);
        return job;
      }
      return null;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}