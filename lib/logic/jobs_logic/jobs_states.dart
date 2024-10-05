import 'package:job_offers_mohammad_ali/data/models/jobs.dart';

import '../../data/models/job.dart';

abstract class JobsStates {}

class JobsFetchInitialState extends JobsStates {}

class JobsFetchInProgress extends JobsStates {}

class JobsFetchSuccess extends JobsStates {
  List<Job> allJobs;
  JobsFetchSuccess({required this.allJobs});
}

class JobsFetchError extends JobsStates {}