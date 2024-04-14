import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

abstract class DressRepository {
  Future<Either<Failure,List<Dress>>> getDressesList();
}