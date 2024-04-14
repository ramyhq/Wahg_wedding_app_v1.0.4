import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';

abstract class JobRepository {
  Future<Either<Failure,List<Job>>> getJobsList();
}