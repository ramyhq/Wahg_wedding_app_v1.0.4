// ignore_for_file: must_be_immutable
part of 'jobs_bloc.dart';

class JobsState extends Equatable {
  List<Job> jobsList;
  Job selectedJob;
  RequestState? requestState;

  JobsState({
    this.selectedJob = const Job(),
    this.jobsList = const[],
    this.requestState = RequestState.initial,
  });

  JobsState copyWith({
    List<Job>? jobsList,
    Job? selectedJob,
    RequestState? requestState,
  }) {
    return JobsState(
      jobsList: jobsList ?? this.jobsList,
      selectedJob: selectedJob ?? this.selectedJob,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,jobsList,selectedJob];
}


