import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';

abstract class TravelRepository {
  Future<Either<Failure,List<Travel>>> getTravelList();
}