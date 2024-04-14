import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetCategoryUseCase {
  final CategoryRepository categoryRepository;
  GetCategoryUseCase({required this.categoryRepository});

  Future<Either<Failure, List<Category>>> getCategories() {
    return categoryRepository.getCategories();
  }
}
