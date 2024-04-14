import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/data/datasource/remote/firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/jobs/job_firebase_datasource.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/jobs/job_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/jobs/job_repository.dart';

class JobRepositoryImp implements JobRepository {
  final JobsFirebaseRemoteDataSource jobRemoteDataSource;

  JobRepositoryImp({required this.jobRemoteDataSource});

  @override
  Future<Either<Failure, List<Job>>> getJobsList() async{
    try {
      final list = await jobRemoteDataSource.getJobsList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > JobRepositoryImp > in getJobsList() :$e'));
    }
  }

}
