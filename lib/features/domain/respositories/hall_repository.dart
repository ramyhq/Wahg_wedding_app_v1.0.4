import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

abstract class HallRepository {
  Future<Either<Failure,List<Hall>>> getHallsList();
}