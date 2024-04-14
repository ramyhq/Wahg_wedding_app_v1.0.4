// ignore_for_file: must_be_immutable

part of 'jobs_bloc.dart';

@immutable
abstract class JobsEvent extends Equatable {}

class GetJobsListEvent extends JobsEvent {
  @override
  List<Object> get props => [];
}

class OpenJobDetailsEvent extends JobsEvent {
  Job selectedJob;

  OpenJobDetailsEvent(
    this.selectedJob,
  );
  @override
  List<Object> get props => [selectedJob];
}
