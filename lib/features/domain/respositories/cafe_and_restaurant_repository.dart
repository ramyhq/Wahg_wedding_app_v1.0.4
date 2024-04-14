import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

abstract class CafeAndRestaurantRepository {
  Future<Either<Failure,List<CafeAndRestaurant>>> getCafeAndRestaurantList();
}