import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/jobs/job_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetJobUseCase {
  final JobRepository jobRepository;
  GetJobUseCase({required this.jobRepository});

  Future<Either<Failure, List<Job>>> getJobsList() {
    return jobRepository.getJobsList();
  }
}
