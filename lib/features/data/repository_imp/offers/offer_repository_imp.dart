import 'package:dartz/dartz.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource.dart';
import 'package:wahg_v1/features/domain/entities/category_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';
import 'package:wahg_v1/features/domain/respositories/category_repository.dart';
import 'package:wahg_v1/features/domain/respositories/hall_repository.dart';
import 'package:wahg_v1/features/domain/respositories/offer/offer_repository.dart';

class OfferRepositoryImp implements OfferRepository {
  final OffersFirebaseRemoteDataSource offerRemoteDataSource;

  OfferRepositoryImp({required this.offerRemoteDataSource});

  @override
  Future<Either<Failure, List<Offer>>> getOffersList() async{
    try {
      final list = await offerRemoteDataSource.getOffersList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure('[ServerFailure ❌] > OfferRepositoryImp > in getOffersList() :$e'));
    }
  }

}
