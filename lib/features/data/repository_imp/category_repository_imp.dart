import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import '../datasource/remote/firebase_datasource.dart';

class CategoryRepositoryImp implements CategoryRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  CategoryRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final list = await remoteDataSource.getCategories();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > CategoryRepositoryImp > in getCategories() :$e'));
    }
  }

}
