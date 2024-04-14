import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/respositories/cafe_and_restaurant_repository.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class CafeAndRestaurantRepositoryImp implements CafeAndRestaurantRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  CafeAndRestaurantRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CafeAndRestaurant>>> getCafeAndRestaurantList() async{
    try {
      final list = await remoteDataSource.getCafeAndRestaurantList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > CafeAndRestaurantRepositoryImp > in getCafeAndRestaurantList() :$e'));
    }
  }

}
