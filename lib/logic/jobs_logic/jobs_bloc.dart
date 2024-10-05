import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_offers_mohammad_ali/connection/network_helper.dart';
import 'package:job_offers_mohammad_ali/data/models/jobs.dart';
import 'package:job_offers_mohammad_ali/data/repos/jobs_repo.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_event.dart';
import 'package:job_offers_mohammad_ali/logic/jobs_logic/jobs_states.dart';
import 'package:bloc/bloc.dart';

import '../../data/models/job.dart';

class JobsBloc extends Bloc<JobsEvents, JobsStates> {
  JobsRepo jobsRepo = JobsRepo(networkHelper: NetworkHelper());
  late Jobs? jobs;
  List<Job> allJobs = [];
  JobsBloc() : super(JobsFetchInitialState()) {
    on<StartFetchJobs>((event, state) async {
      emit(JobsFetchInProgress());
      try {
        jobs = await jobsRepo.fetchJobs();
        print(jobs!.count);
        for (var data in jobs!.data!) {
          allJobs.add(data.job!);
        }
        print(allJobs[0].status!.id);
        emit(JobsFetchSuccess(allJobs: allJobs));
      } catch (e) {
        print(e.toString());
        emit(JobsFetchError());
      }
    });
  }
}
