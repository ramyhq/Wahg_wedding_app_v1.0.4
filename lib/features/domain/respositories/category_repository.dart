import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import '../../../../const/app_enums.dart';

abstract class CategoryRepository {
  Future<Either<Failure,List<Category>>> getCategories();
}