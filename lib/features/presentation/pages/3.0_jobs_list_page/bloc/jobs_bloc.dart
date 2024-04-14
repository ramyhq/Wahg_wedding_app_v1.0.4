import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';
import 'package:wahg_v1/features/domain/usecases/jobs/job_usecase.dart';


part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc() : super(JobsState()) {
    on<GetJobsListEvent>(_loadJobsList);
    on<OpenJobDetailsEvent>(_loadJobsDetails);
  }



  FutureOr<void> _loadJobsList(GetJobsListEvent event, Emitter<JobsState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

     final res = await GetJobUseCase(jobRepository: sl.call())
        .getJobsList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Job is : ${state.jobsList}');
    }, (List<Job> data) {
      print('1 Job is : ${state.jobsList}');
      emit(state.copyWith(jobsList: data, requestState: RequestState.done));
      print('2 Job is : ${state.jobsList}');
    });
  }

  FutureOr<void> _loadJobsDetails(OpenJobDetailsEvent event, Emitter<JobsState> emit) async{
    emit(state.copyWith(selectedJob: event.selectedJob));

  }
}

