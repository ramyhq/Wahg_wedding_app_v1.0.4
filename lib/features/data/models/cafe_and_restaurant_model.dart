import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';

class CafeAndRestaurantModel extends CafeAndRestaurant {
  const CafeAndRestaurantModel({
    required super.cafeAndRestaurantTitle,
    required super.cafeAndRestaurantDescription,
    required super.cafeAndRestaurantAddress,
    required super.cafeAndRestaurantPrice,
    required super.cafeAndRestaurantPhone1,
    required super.cafeAndRestaurantPhone2,
    required super.cafeAndRestaurantPhone3,
    required super.cafeAndRestaurantFacebook,
    required super.cafeAndRestaurantWhatsApp,
    required super.cafeAndRestaurantLocation,
    required super.cafeAndRestaurantCategory,
    required super.cafeAndRestaurantRating,
    required super.cafeAndRestaurantCreated,
    required super.lastUpdate,
    required super.cafeAndRestaurantId,
    required super.cafeAndRestaurantImages,
  });

  factory CafeAndRestaurantModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return CafeAndRestaurantModel(
        cafeAndRestaurantTitle: doc.get('cafeAndRestaurantTitle') as String,
        cafeAndRestaurantDescription: doc.get('cafeAndRestaurantDescription') as String,
        cafeAndRestaurantAddress: doc.get('cafeAndRestaurantAddress') as String,
        cafeAndRestaurantPrice: doc.get('cafeAndRestaurantPrice') as String,
        cafeAndRestaurantPhone1: doc.get('cafeAndRestaurantPhone1') as String,
        cafeAndRestaurantPhone2: doc.get('cafeAndRestaurantPhone2') as String,
        cafeAndRestaurantPhone3: doc.get('cafeAndRestaurantPhone3') as String,
        cafeAndRestaurantFacebook: doc.get('cafeAndRestaurantFacebook') as String,
        cafeAndRestaurantWhatsApp: doc.get('cafeAndRestaurantWhatsApp') as String,
        cafeAndRestaurantLocation: doc.get('cafeAndRestaurantLocation') as String,
        cafeAndRestaurantCategory: doc.get('cafeAndRestaurantCategory') as String,
        cafeAndRestaurantRating: doc.get('cafeAndRestaurantRating') as String,
        cafeAndRestaurantCreated: doc.get('cafeAndRestaurantCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        cafeAndRestaurantImages: List<String>.from(doc.get('cafeAndRestaurantImages')) ,

        cafeAndRestaurantId: doc.id,
      );
    } catch (e) {
      print('555 cafeAndRestaurants Remote Imp is :$e');

      throw '❌ Error in CafeAndRestaurantModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory CafeAndRestaurantModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var cafeAndRestaurant = CafeAndRestaurantModel(
        cafeAndRestaurantTitle: data['cafeAndRestaurantTitle'],
        cafeAndRestaurantDescription: data['cafeAndRestaurantDescription'] ?? "",
        cafeAndRestaurantAddress: data['cafeAndRestaurantAddress'] ?? "",
        cafeAndRestaurantPrice: data['cafeAndRestaurantPrice'] ?? "",
        cafeAndRestaurantPhone1: data['cafeAndRestaurantPhone1'] ?? "",
        cafeAndRestaurantPhone2: data['cafeAndRestaurantPhone2'] ?? "",
        cafeAndRestaurantPhone3: data['cafeAndRestaurantPhone3'] ?? "",
        cafeAndRestaurantFacebook: data['cafeAndRestaurantFacebook'] ?? "",
        cafeAndRestaurantWhatsApp: data['cafeAndRestaurantWhatsApp'] ?? "",
        cafeAndRestaurantLocation: data['cafeAndRestaurantLocation'] ?? "",
        cafeAndRestaurantCategory: data['cafeAndRestaurantCategory'] ?? "",
        cafeAndRestaurantRating: data['cafeAndRestaurantRating'] ?? "",
        cafeAndRestaurantCreated: data['cafeAndRestaurantCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        cafeAndRestaurantImages: doc.get('cafeAndRestaurantImages') ??  [],
        cafeAndRestaurantId: data['cafeAndRestaurantId'] ?? "",
      );
      return cafeAndRestaurant;
    } catch (e) {
      throw '❌ Error in CafeAndRestaurantModel.fromSnapshot : $e';
    }
  }

  factory CafeAndRestaurantModel.fromJson(Map<String, dynamic> json) {
    return CafeAndRestaurantModel(
      cafeAndRestaurantTitle: json['cafeAndRestaurantTitle'] as String,
      cafeAndRestaurantDescription: json['cafeAndRestaurantDescription'] as String,
      cafeAndRestaurantAddress: json['cafeAndRestaurantAddress'] as String,
      cafeAndRestaurantPrice: json['cafeAndRestaurantPrice'] as String,
      cafeAndRestaurantPhone1: json['cafeAndRestaurantPhone1'] as String?,
      cafeAndRestaurantPhone2: json['cafeAndRestaurantPhone2'] as String?,
      cafeAndRestaurantPhone3: json['cafeAndRestaurantPhone3'] as String?,
      cafeAndRestaurantFacebook: json['cafeAndRestaurantFacebook'] as String,
      cafeAndRestaurantWhatsApp: json['cafeAndRestaurantWhatsApp'] as String,
      cafeAndRestaurantLocation: json['cafeAndRestaurantLocation'] as String,
      cafeAndRestaurantCategory: json['cafeAndRestaurantCategory'] as String,
      cafeAndRestaurantRating: json['cafeAndRestaurantRating'] as String,
      cafeAndRestaurantCreated: json['cafeAndRestaurantCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      cafeAndRestaurantImages: List<String>.from(json['cafeAndRestaurantImages']) ,

      cafeAndRestaurantId: json['cafeAndRestaurantId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'cafeAndRestaurantTitle': cafeAndRestaurantTitle,
      'cafeAndRestaurantDescription': cafeAndRestaurantDescription,
      'cafeAndRestaurantAddress': cafeAndRestaurantAddress,
      'cafeAndRestaurantPrice': cafeAndRestaurantPrice,
      'cafeAndRestaurantPhone1': cafeAndRestaurantPhone1,
      'cafeAndRestaurantPhone2': cafeAndRestaurantPhone2,
      'cafeAndRestaurantPhone3': cafeAndRestaurantPhone3,
      'cafeAndRestaurantFacebook': cafeAndRestaurantFacebook,
      'cafeAndRestaurantWhatsApp': cafeAndRestaurantWhatsApp,
      'cafeAndRestaurantLocation': cafeAndRestaurantLocation,
      'cafeAndRestaurantCategory': cafeAndRestaurantCategory,
      'cafeAndRestaurantRating': cafeAndRestaurantRating,
      'cafeAndRestaurantCreated': cafeAndRestaurantCreated,
      'lastUpdate': lastUpdate,
      'cafeAndRestaurantImages': cafeAndRestaurantImages,
      'cafeAndRestaurantId': cafeAndRestaurantId,
    };
  }
}
