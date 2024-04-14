import 'package:wahg_v1/features/data/models/cafe_and_restaurant_model.dart';
import 'package:wahg_v1/features/data/models/category_model.dart';
import 'package:wahg_v1/features/data/models/dress_model.dart';
import 'package:wahg_v1/features/data/models/hair_model.dart';
import 'package:wahg_v1/features/data/models/hall_model.dart';
import 'package:wahg_v1/features/data/models/makeup_artist_model.dart';
import 'package:wahg_v1/features/data/models/photographer_model.dart';
import 'package:wahg_v1/features/data/models/suit_model.dart';
import 'package:wahg_v1/features/data/models/travel_model.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';

abstract class FirebaseRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<HallModel>> getHallsList();
  Future<List<DressModel>> getDressList();
  Future<List<PhotographerModel>> getPhotographerList();
  Future<List<CafeAndRestaurantModel>> getCafeAndRestaurantList();
  Future<List<HairModel>> getHairList();
  Future<List<SuitModel>> getSuitsList();
  Future<List<TravelModel>> getTravelList();
  Future<List<MakeupArtistModel>> getMakeupArtistList();

  Future<void> updateAllHallsList({required List<Map<String, dynamic>> data});
  Future<void> updateAllDressesList({required List<Map<String, dynamic>> data});
  Future<void> updateAllPhotographerList(
      {required List<Map<String, dynamic>> data});
  Future<void> updateAllCafeAndRestaurantList(
      {required List<Map<String, dynamic>> data});
  Future<void> updateAllHairList({required List<Map<String, dynamic>> data});
  Future<void> updateAllSuitsList({required List<Map<String, dynamic>> data});
  Future<void> updateAllTravelList({required List<Map<String, dynamic>> data});
  Future<void> updateAllMakeupArtistList({required List<Map<String, dynamic>> data});
}
