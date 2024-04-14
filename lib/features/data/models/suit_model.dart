import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';

class SuitModel extends Suit {
  const SuitModel({
    required super.suitTitle,
    required super.suitDescription,
    required super.suitAddress,
    required super.suitPrice,
    required super.suitPhone1,
    required super.suitPhone2,
    required super.suitPhone3,
    required super.suitFacebook,
    required super.suitWhatsApp,
    required super.suitLocation,
    required super.suitCategory,
    required super.suitRating,
    required super.suitCreated,
    required super.lastUpdate,
    required super.suitId,
    required super.suitImages,
  });

  factory SuitModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return SuitModel(
        suitTitle: doc.get('suitTitle') as String,
        suitDescription: doc.get('suitDescription') as String,
        suitAddress: doc.get('suitAddress') as String,
        suitPrice: doc.get('suitPrice') as String,
        suitPhone1: doc.get('suitPhone1') as String,
        suitPhone2: doc.get('suitPhone2') as String,
        suitPhone3: doc.get('suitPhone3') as String,
        suitFacebook: doc.get('suitFacebook') as String,
        suitWhatsApp: doc.get('suitWhatsApp') as String,
        suitLocation: doc.get('suitLocation') as String,
        suitCategory: doc.get('suitCategory') as String,
        suitRating: doc.get('suitRating') as String,
        suitCreated: doc.get('suitCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        suitImages: List<String>.from(doc.get('suitImages')) ,

        suitId: doc.id,
      );
    } catch (e) {
      print('555 Suits Remote Imp is :$e');

      throw '❌ Error in SuitModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory SuitModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var suit = SuitModel(
        suitTitle: data['suitTitle'],
        suitDescription: data['suitDescription'] ?? "",
        suitAddress: data['suitAddress'] ?? "",
        suitPrice: data['suitPrice'] ?? "",
        suitPhone1: data['suitPhone1'] ?? "",
        suitPhone2: data['suitPhone2'] ?? "",
        suitPhone3: data['suitPhone3'] ?? "",
        suitFacebook: data['suitFacebook'] ?? "",
        suitWhatsApp: data['suitWhatsApp'] ?? "",
        suitLocation: data['suitLocation'] ?? "",
        suitCategory: data['suitCategory'] ?? "",
        suitRating: data['suitRating'] ?? "",
        suitCreated: data['suitCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        suitImages: doc.get('suitImages') ??  [],
        suitId: data['suitId'] ?? "",
      );
      return suit;
    } catch (e) {
      throw '❌ Error in SuitModel.fromSnapshot : $e';
    }
  }

  factory SuitModel.fromJson(Map<String, dynamic> json) {
    return SuitModel(
      suitTitle: json['suitTitle'] as String,
      suitDescription: json['suitDescription'] as String,
      suitAddress: json['suitAddress'] as String,
      suitPrice: json['suitPrice'] as String,
      suitPhone1: json['suitPhone1'] as String?,
      suitPhone2: json['suitPhone2'] as String?,
      suitPhone3: json['suitPhone3'] as String?,
      suitFacebook: json['suitFacebook'] as String,
      suitWhatsApp: json['suitWhatsApp'] as String,
      suitLocation: json['suitLocation'] as String,
      suitCategory: json['suitCategory'] as String,
      suitRating: json['suitRating'] as String,
      suitCreated: json['suitCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      suitImages: List<String>.from(json['suitImages']) ,

      suitId: json['suitId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'suitTitle': suitTitle,
      'suitDescription': suitDescription,
      'suitAddress': suitAddress,
      'suitPrice': suitPrice,
      'suitPhone1': suitPhone1,
      'suitPhone2': suitPhone2,
      'suitPhone3': suitPhone3,
      'suitFacebook': suitFacebook,
      'suitWhatsApp': suitWhatsApp,
      'suitLocation': suitLocation,
      'suitCategory': suitCategory,
      'suitRating': suitRating,
      'suitCreated': suitCreated,
      'lastUpdate': lastUpdate,
      'suitImages': suitImages,
      'suitId': suitId,
    };
  }
}
