import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';
import 'package:wahg_v1/commons/error/failure.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource.dart';
import 'package:wahg_v1/features/data/datasource/remote/offers/offer_firebase_datasource.dart';

import 'package:wahg_v1/features/data/models/offers/offer_model.dart';
import 'package:wahg_v1/features/data/models/offers/offer_model.dart';


class OffersFirebaseRemoteDataSourceImp extends OffersFirebaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  OffersFirebaseRemoteDataSourceImp({
    required this.firestore,
    required this.auth,
    required this.googleSignIn,
  });

  Future<String> getCurrentUserId() async => auth.currentUser!.uid;
  

  ///////// Offers /////////

  // Collection >> "o1_offers_col"
  @override
  Future<List<OfferModel>> getOffersList() async {
    List<OfferModel> list = [];
    QuerySnapshot<Map<String, dynamic>> col;

    // try {
    //   // To Clear cached data
    //   await firestore.terminate();
    //   await firestore.clearPersistence();
    // } catch (e) {
    //   print('❌ firestore.terminate() in getOffersList() FAILED $e');
    // }

    try {
      col = await firestore.collection("o1_offers_col").get();
      col.docs.map((doc) {
        OfferModel offer = OfferModel.fromSnapshot(doc);
        list.add(offer);
      }).toList();

      //print('📍 1.0: in getOffersList list : ${list}');
      //print('📍 1.3: in getOffersList list : ${list[0].offerTitle}');
      //print('📍 1.3: in getOffersList list length : ${list.length}');
      return list;
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in getOffersList() :$e');
    }
  }

  @override
  Future<void> updateAllOffersList({
    required List<Map<String, dynamic>> data,
  }) async {
    try {
      for (var offer in data) {
        //String offerId = Uuid().v1();
        // offer['offerId'] = offerId;
        await firestore
            .collection('o1_offers_col')
            .doc(offer['offerId'])
            .set(offer);
        print('2 :${offer['offerTitle']}');
        print('id :${offer['offerId']}');
      }
    } catch (e) {
      throw ServerFailure(
          '[ServerFailure ❌] > FirebaseRemoteDataSourceImp > in updateAllOffersList() :$e');
    }
  }

}

