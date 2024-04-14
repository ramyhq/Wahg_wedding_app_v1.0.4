import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';

abstract class SuitRepository {
  Future<Either<Failure,List<Suit>>> getSuitsList();
}