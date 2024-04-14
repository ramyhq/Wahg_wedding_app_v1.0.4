import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';

abstract class OfferRepository {
  Future<Either<Failure,List<Offer>>> getOffersList();
}