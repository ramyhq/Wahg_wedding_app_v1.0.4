import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hair_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetHairUseCase {
  final HairRepository hairRepository;
  GetHairUseCase({required this.hairRepository});

  Future<Either<Failure, List<Hair>>> getHairList() {
    return hairRepository.getHairList();
  }
}
