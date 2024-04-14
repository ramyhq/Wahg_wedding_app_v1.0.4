import 'package:dartz/dartz.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/offer/offer_repository.dart';
import '../../../../commons/error/failure.dart';
import '../../../../const/app_enums.dart';

class GetOfferUseCase {
  final OfferRepository offerRepository;
  GetOfferUseCase({required this.offerRepository});

  Future<Either<Failure, List<Offer>>> getOffersList() {
    return offerRepository.getOffersList();
  }
}
