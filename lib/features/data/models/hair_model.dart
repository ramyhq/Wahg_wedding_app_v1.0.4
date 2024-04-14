import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';

class HairModel extends Hair {
  const HairModel({
    required super.hairTitle,
    required super.hairDescription,
    required super.hairAddress,
    required super.hairPrice,
    required super.hairPhone1,
    required super.hairPhone2,
    required super.hairPhone3,
    required super.hairFacebook,
    required super.hairWhatsApp,
    required super.hairLocation,
    required super.hairCategory,
    required super.hairRating,
    required super.hairCreated,
    required super.lastUpdate,
    required super.hairId,
    required super.hairImages,
  });

  factory HairModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return HairModel(
        hairTitle: doc.get('hairTitle') as String,
        hairDescription: doc.get('hairDescription') as String,
        hairAddress: doc.get('hairAddress') as String,
        hairPrice: doc.get('hairPrice') as String,
        hairPhone1: doc.get('hairPhone1') as String,
        hairPhone2: doc.get('hairPhone2') as String,
        hairPhone3: doc.get('hairPhone3') as String,
        hairFacebook: doc.get('hairFacebook') as String,
        hairWhatsApp: doc.get('hairWhatsApp') as String,
        hairLocation: doc.get('hairLocation') as String,
        hairCategory: doc.get('hairCategory') as String,
        hairRating: doc.get('hairRating') as String,
        hairCreated: doc.get('hairCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        hairImages: List<String>.from(doc.get('hairImages')) ,

        hairId: doc.id,
      );
    } catch (e) {
      print('555 Hair Remote Imp is :$e');

      throw '❌ Error in HairModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory HairModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var hair = HairModel(
        hairTitle: data['hairTitle'],
        hairDescription: data['hairDescription'] ?? "",
        hairAddress: data['hairAddress'] ?? "",
        hairPrice: data['hairPrice'] ?? "",
        hairPhone1: data['hairPhone1'] ?? "",
        hairPhone2: data['hairPhone2'] ?? "",
        hairPhone3: data['hairPhone3'] ?? "",
        hairFacebook: data['hairFacebook'] ?? "",
        hairWhatsApp: data['hairWhatsApp'] ?? "",
        hairLocation: data['hairLocation'] ?? "",
        hairCategory: data['hairCategory'] ?? "",
        hairRating: data['hairRating'] ?? "",
        hairCreated: data['hairCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        hairImages: doc.get('hairImages') ??  [],
        hairId: data['hairId'] ?? "",
      );
      return hair;
    } catch (e) {
      throw '❌ Error in HairModel.fromSnapshot : $e';
    }
  }

  factory HairModel.fromJson(Map<String, dynamic> json) {
    return HairModel(
      hairTitle: json['hairTitle'] as String,
      hairDescription: json['hairDescription'] as String,
      hairAddress: json['hairAddress'] as String,
      hairPrice: json['hairPrice'] as String,
      hairPhone1: json['hairPhone1'] as String?,
      hairPhone2: json['hairPhone2'] as String?,
      hairPhone3: json['hairPhone3'] as String?,
      hairFacebook: json['hairFacebook'] as String,
      hairWhatsApp: json['hairWhatsApp'] as String,
      hairLocation: json['hairLocation'] as String,
      hairCategory: json['hairCategory'] as String,
      hairRating: json['hairRating'] as String,
      hairCreated: json['hairCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      hairImages: List<String>.from(json['hairImages']) ,

      hairId: json['hairId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'hairTitle': hairTitle,
      'hairDescription': hairDescription,
      'hairAddress': hairAddress,
      'hairPrice': hairPrice,
      'hairPhone1': hairPhone1,
      'hairPhone2': hairPhone2,
      'hairPhone3': hairPhone3,
      'hairFacebook': hairFacebook,
      'hairWhatsApp': hairWhatsApp,
      'hairLocation': hairLocation,
      'hairCategory': hairCategory,
      'hairRating': hairRating,
      'hairCreated': hairCreated,
      'lastUpdate': lastUpdate,
      'hairImages': hairImages,
      'hairId': hairId,
    };
  }
}
