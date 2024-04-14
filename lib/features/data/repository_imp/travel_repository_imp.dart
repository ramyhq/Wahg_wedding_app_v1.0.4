import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/travel_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class TravelRepositoryImp implements TravelRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  TravelRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Travel>>> getTravelList() async{
    try {
      final list = await remoteDataSource.getTravelList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > TravelRepositoryImp > in getTravelsList() :$e'));
    }
  }

}
