import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/suit_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class SuitRepositoryImp implements SuitRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  SuitRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Suit>>> getSuitsList() async{
    try {
      final list = await remoteDataSource.getSuitsList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > SuitRepositoryImp > in getSuitsList() :$e'));
    }
  }

}
