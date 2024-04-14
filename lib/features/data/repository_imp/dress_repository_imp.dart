import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class DressRepositoryImp implements DressRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  DressRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Dress>>> getDressesList() async{
    try {
      final list = await remoteDataSource.getDressList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > DressRepositoryImp > in getDressList() :$e'));
    }
  }



}
