import 'package:job_offers_mohammad_ali/data/models/job.dart';
import 'package:job_offers_mohammad_ali/data/models/job_details.dart';

abstract class JobDetailsStates {}

class JobDetailsInitialState extends JobDetailsStates {}

class JobDetailsInProgress extends JobDetailsStates {}

class JobDetailsSuccess extends JobDetailsStates {
  JobDetails job;
  JobDetailsSuccess({required this.job});
}

class JobDetailsErrorState extends JobDetailsStates {}