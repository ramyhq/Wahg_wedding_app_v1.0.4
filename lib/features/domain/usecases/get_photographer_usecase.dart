import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/dress_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/photographer_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetPhotographerUseCase {
  final PhotographerRepository photographerRepository;
  GetPhotographerUseCase({required this.photographerRepository});

  Future<Either<Failure, List<Photographer>>> getPhotographerList() {
    return photographerRepository.getPhotographerList();
  }
}
