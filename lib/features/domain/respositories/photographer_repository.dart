import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';

abstract class PhotographerRepository {
  Future<Either<Failure,List<Photographer>>> getPhotographerList();
}