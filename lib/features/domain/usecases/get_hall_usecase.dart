import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetHallUseCase {
  final HallRepository hallRepository;
  GetHallUseCase({required this.hallRepository});

  Future<Either<Failure, List<Hall>>> getHallsList() {
    return hallRepository.getHallsList();
  }
}
