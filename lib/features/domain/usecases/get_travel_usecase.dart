import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/travel_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetTravelUseCase {
  final TravelRepository travelRepository;
  GetTravelUseCase({required this.travelRepository});

  Future<Either<Failure, List<Travel>>> getTravelList() {
    return travelRepository.getTravelList();
  }
}
