import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetDressesUseCase {
  final DressRepository dressRepository;
  GetDressesUseCase({required this.dressRepository});

  Future<Either<Failure, List<Dress>>> getDressesList() {
    return dressRepository.getDressesList();
  }
}
