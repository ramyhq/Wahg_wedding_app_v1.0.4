import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/data/models/cafe_and_restaurant_model.dart';
import 'package:wahg_v1/features/data/models/category_model.dart';
import 'package:wahg_v1/features/data/models/dress_model.dart';
import 'package:wahg_v1/features/data/models/hair_model.dart';
import 'package:wahg_v1/features/data/models/hall_model.dart';
import 'package:wahg_v1/features/data/models/makeup_artist_model.dart';
import 'package:wahg_v1/features/data/models/photographer_model.dart';
import 'package:wahg_v1/features/data/models/suit_model.dart';
import 'package:wahg_v1/features/data/models/travel_model.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';

import 'firebase_datasource.dart';

class FirebaseRemoteDataSourceImp extends FirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDataSourceImp({
    required this.firestore,
    required this.auth,
    required this.googleSignIn,
  });

  Future<String> getCurrentUserId() async => auth.currentUser!.uid;
  
  
  ///////// Categories /////////

  // Collection >> "app_categories_col"
  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    try {
      // To Clear cached data
      await firestore.terminate();
      await firestore.clearPersistence();
    } catch (e) {
      print('❌ firestore.terminate() in getCategories() FAILED $e');
    }

    try {
      col = await firestore.collection("app_categories_col").get();
      col.docs.map((doc) {
        CategoryModel category = CategoryModel.fromSnapshot(doc);
        list.add(category);
      }).toList();

      //print('📍 1.0: in getCategories list : ${list}');
      //print('📍 1.3: in getCategories list : ${list[0].categoryName}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getCategories() :$e');
    }
  }
  ///////// Halls /////////

  // Collection >> "s1_halls_col"
  @override
  Future<List<HallModel>> getHallsList() async {
    List<HallModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getHallsList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s1_halls_col").get();
      col.docs.map((doc) {
        HallModel hall = HallModel.fromSnapshot(doc);
        list.add(hall);
      }).toList();

      //print('📍 1.0: in getHallsList list : ${list}');
      //print('📍 1.3: in getHallsList list : ${list[0].hallTitle}');
      //print('📍 1.3: in getHallsList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getHallsList() :$e');
    }
  }

  @override
  Future<void> updateAllHallsList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var hall in data) {
        //String hallId = Uuid().v1();
        // hall['hallId'] = hallId;
        await firestore
            .collection('s1_halls_col')
            .doc(hall['hallId'])
            .set(hall);
        print('2 :${hall['hallTitle']}');
        print('id :${hall['hallId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllHallsList() :$e');
    }
  }

  ///////// Dresses /////////

  // Collection >> "s2_dresses_col"
  @override
  Future<List<DressModel>> getDressList() async{
    List<DressModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getDressList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s2_dresses_col").get();
      col.docs.map((doc) {
        DressModel dress = DressModel.fromSnapshot(doc);
        list.add(dress);
      }).toList();

      //print('📍 1.0: in getDressList list : ${list}');
      //print('📍 1.3: in getDressList list : ${list[0].dressTitle}');
      //print('📍 1.3: in getDressList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getDressList() :$e');
    }
  }

  @override
  Future<void> updateAllDressesList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var dress in data) {
        //String dressId = Uuid().v1();
        // dress['dressId'] = dressId;
        await firestore
            .collection('s2_dresses_col')
            .doc(dress['dressId'])
            .set(dress);
        print('2 :${dress['dressTitle']}');
        print('id :${dress['dressId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllDressesList() :$e');
    }
  }
///////// Photographer /////////

  // Collection >> "s8_photographer_col"
  @override
  Future<List<PhotographerModel>> getPhotographerList() async{
    List<PhotographerModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getPhotographerList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s8_photographer_col").get();
      col.docs.map((doc) {
        PhotographerModel photographer = PhotographerModel.fromSnapshot(doc);
        list.add(photographer);
      }).toList();

      //print('📍 1.0: in getPhotographerList list : ${list}');
      //print('📍 1.3: in getPhotographerList list : ${list[0].photographerTitle}');
     // print('📍 1.3: in getPhotographerList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getPhotographerList() :$e');
    }
  }

  @override
  Future<void> updateAllPhotographerList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var photographer in data) {
        //String photographerId = Uuid().v1();
        // photographer['photographerId'] = photographerId;
        await firestore
            .collection('s8_photographer_col')
            .doc(photographer['photographerId'])
            .set(photographer);
        print('2 :${photographer['photographerTitle']}');
        print('id :${photographer['photographerId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllPhotographerList() :$e');
    }
  }

  ///////// CafeAndRestaurant /////////

  // Collection >> "s6_cafe_and_restaurant_col"
  @override
  Future<List<CafeAndRestaurantModel>> getCafeAndRestaurantList() async {
    List<CafeAndRestaurantModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getCafeAndRestaurantList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s6_cafe_and_restaurant_col").get();
      col.docs.map((doc) {
        CafeAndRestaurantModel cafeAndRestaurant = CafeAndRestaurantModel.fromSnapshot(doc);
        list.add(cafeAndRestaurant);
      }).toList();

      //print('📍 1.0: in getCafeAndRestaurantList list : ${list}');
      //print('📍 1.3: in getCafeAndRestaurantList list : ${list[0].cafeAndRestaurantTitle}');
      //print('📍 1.3: in getCafeAndRestaurantList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getCafeAndRestaurantList() :$e');
    }
  }
  @override
  Future<void> updateAllCafeAndRestaurantList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var cafeAndRestaurant in data) {
        //String cafeAndRestaurantId = Uuid().v1();
        // cafeAndRestaurant['cafeAndRestaurantId'] = cafeAndRestaurantId;
        await firestore
            .collection('s6_cafe_and_restaurant_col')
            .doc(cafeAndRestaurant['cafeAndRestaurantId'])
            .set(cafeAndRestaurant);
        print('2 :${cafeAndRestaurant['cafeAndRestaurantTitle']}');
        print('id :${cafeAndRestaurant['cafeAndRestaurantId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllCafeAndRestaurantsList() :$e');
    }
  }

  ///////// Hair /////////

  // Collection >> "s4_hair_col"
  @override
  Future<List<HairModel>> getHairList() async {
    List<HairModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getHairList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s4_hair_col").get();
      col.docs.map((doc) {
        HairModel hair = HairModel.fromSnapshot(doc);
        list.add(hair);
      }).toList();

      //print('📍 1.0: in getHairList list : ${list}');
      //print('📍 1.3: in getHairList list : ${list[0].hairTitle}');
      //print('📍 1.3: in getHairList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getHairList() :$e');
    }
  }
  @override
  Future<void> updateAllHairList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var hair in data) {
        //String hairId = Uuid().v1();
        // hair['hairId'] = hairId;
        await firestore
            .collection('s4_hair_col')
            .doc(hair['hairId'])
            .set(hair);
        print('2 :${hair['hairTitle']}');
        print('id :${hair['hairId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllHairsList() :$e');
    }
  }

  ///////// Suits /////////

  // Collection >> "s5_suits_col"
  @override
  Future<List<SuitModel>> getSuitsList() async {
    List<SuitModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getSuitsList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s5_suits_col").get();
      col.docs.map((doc) {
        SuitModel suit = SuitModel.fromSnapshot(doc);
        list.add(suit);
      }).toList();

      //print('📍 1.0: in getSuitsList list : ${list}');
      //print('📍 1.3: in getSuitsList list : ${list[0].suitTitle}');
      //print('📍 1.3: in getSuitsList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getSuitsList() :$e');
    }
  }

  @override
  Future<void> updateAllSuitsList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var suit in data) {
        //String suitId = Uuid().v1();
        // suit['suitId'] = suitId;
        await firestore
            .collection('s5_suits_col')
            .doc(suit['suitId'])
            .set(suit);
        print('2 :${suit['suitTitle']}');
        print('id :${suit['suitId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllSuitsList() :$e');
    }
  }


  ///////// Travel /////////

  // Collection >> "s7_travel_col"
  @override
  Future<List<TravelModel>> getTravelList() async {
    List<TravelModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getTravelsList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s7_travel_col").get();
      col.docs.map((doc) {
        TravelModel travel = TravelModel.fromSnapshot(doc);
        list.add(travel);
      }).toList();

      //print('📍 1.0: in getTravelsList list : ${list}');
      //print('📍 1.3: in getTravelsList list : ${list[0].hallTitle}');
      //print('📍 1.3: in getTravelsList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getTravelsList() :$e');
    }
  }

  @override
  Future<void> updateAllTravelList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var travel in data) {
        //String travelId = Uuid().v1();
        // travel['travelId'] = travelId;
        await firestore
            .collection('s7_travel_col')
            .doc(travel['travelId'])
            .set(travel);
        print('2 :${travel['travelTitle']}');
        print('id :${travel['travelId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllTravelsList() :$e');
    }
  }
///////// MakeupArtist /////////

  // Collection >> "s3_makeup_artist_col"
  @override
  Future<List<MakeupArtistModel>> getMakeupArtistList() async {
    List<MakeupArtistModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getMakeupArtistList() FAILED $e');
    // }

    try {
      col = await firestore.collection("s3_makeup_artist_col").get();
      col.docs.map((doc) {
        MakeupArtistModel makeupArtist = MakeupArtistModel.fromSnapshot(doc);
        list.add(makeupArtist);
      }).toList();

      //print('📍 1.0: in getMakeupArtistList list : ${list}');
      //print('📍 1.3: in getMakeupArtistList list : ${list[0].makeupArtistTitle}');
      //print('📍 1.3: in getMakeupArtistList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getMakeupArtistList() :$e');
    }
  }

  @override
  Future<void> updateAllMakeupArtistList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var makeupArtist in data) {
        //String makeupArtistId = Uuid().v1();
        // makeupArtist['makeupArtistId'] = makeupArtistId;
        await firestore
            .collection('s3_makeup_artist_col')
            .doc(makeupArtist['makeupArtistId'])
            .set(makeupArtist);
        print('2 :${makeupArtist['makeupArtistTitle']}');
        print('id :${makeupArtist['makeupArtistId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllMakeupArtistList() :$e');
    }
  }

}
