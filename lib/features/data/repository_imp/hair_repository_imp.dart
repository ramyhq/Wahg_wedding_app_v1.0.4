import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hair_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class HairRepositoryImp implements HairRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  HairRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Hair>>> getHairList() async{
    try {
      final list = await remoteDataSource.getHairList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > HairRepositoryImp > in getHairsList() :$e'));
    }
  }

}
