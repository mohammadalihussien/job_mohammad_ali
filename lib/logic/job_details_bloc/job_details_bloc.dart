import 'package:bloc/bloc.dart';
import 'package:job_offers_mohammad_ali/data/models/job.dart';
import 'package:job_offers_mohammad_ali/data/models/job_details.dart';
import 'package:job_offers_mohammad_ali/data/repos/job_details_repo.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_events.dart';
import 'package:job_offers_mohammad_ali/logic/job_details_bloc/job_details_states.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvents,JobDetailsStates> {
  JobDetailsRepo jobDetailsRepo = JobDetailsRepo();
  late JobDetails? job;
  JobDetailsBloc():super(JobDetailsInitialState()){
    on<FetchJobDetails>((event,state)async{
      emit(JobDetailsInProgress());
      try{
        job = await jobDetailsRepo.getJobDetails(event.uuid);
        emit(JobDetailsSuccess(job: job!));
      }catch(e){
        print(e.toString());
        emit(JobDetailsErrorState());
      }
    });
  }
}