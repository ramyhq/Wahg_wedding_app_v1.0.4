import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/respositories/cafe_and_restaurant_repository.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetCafeAndRestaurantUseCase {
  final CafeAndRestaurantRepository cafeAndRestaurantRepository;
  GetCafeAndRestaurantUseCase({required this.cafeAndRestaurantRepository});

  Future<Either<Failure, List<CafeAndRestaurant>>> getCafeAndRestaurantList() {
    return cafeAndRestaurantRepository.getCafeAndRestaurantList();
  }
}
