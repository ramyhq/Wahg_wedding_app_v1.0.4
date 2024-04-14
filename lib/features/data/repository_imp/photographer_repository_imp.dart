import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import 'package:wahg_v1/features/domain/respositories/photographer_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class PhotographerRepositoryImp implements PhotographerRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  PhotographerRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Photographer>>> getPhotographerList() async{
    try {
      final list = await remoteDataSource.getPhotographerList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > PhotographerRepositoryImp > in getPhotographerList() :$e'));
    }
  }



}
