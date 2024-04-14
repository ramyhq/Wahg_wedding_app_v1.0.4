
import 'package:wahg_v1/features/data/models/offers/offer_model.dart';


abstract class OffersFirebaseRemoteDataSource {
  Future<List<OfferModel>> getOffersList();

  Future<void> updateAllOffersList({required List<Map<String, dynamic>> data});

}
