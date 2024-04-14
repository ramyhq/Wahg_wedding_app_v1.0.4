import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

class HallModel extends Hall {
  const HallModel({
    required super.hallTitle,
    required super.hallDescription,
    required super.hallAddress,
    required super.hallPrice,
    required super.hallPhone1,
    required super.hallPhone2,
    required super.hallPhone3,
    required super.hallFacebook,
    required super.hallWhatsApp,
    required super.hallLocation,
    required super.hallCategory,
    required super.hallRating,
    required super.hallCreated,
    required super.lastUpdate,
    required super.hallId,
    required super.hallImages,
  });

  factory HallModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return HallModel(
        hallTitle: doc.get('hallTitle') as String,
        hallDescription: doc.get('hallDescription') as String,
        hallAddress: doc.get('hallAddress') as String,
        hallPrice: doc.get('hallPrice') as String,
        hallPhone1: doc.get('hallPhone1') as String,
        hallPhone2: doc.get('hallPhone2') as String,
        hallPhone3: doc.get('hallPhone3') as String,
        hallFacebook: doc.get('hallFacebook') as String,
        hallWhatsApp: doc.get('hallWhatsApp') as String,
        hallLocation: doc.get('hallLocation') as String,
        hallCategory: doc.get('hallCategory') as String,
        hallRating: doc.get('hallRating') as String,
        hallCreated: doc.get('hallCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        hallImages: List<String>.from(doc.get('hallImages')) ,

        hallId: doc.id,
      );
    } catch (e) {
      print('555 Halls Remote Imp is :$e');

      throw '❌ Error in HallModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory HallModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var hall = HallModel(
        hallTitle: data['hallTitle'],
        hallDescription: data['hallDescription'] ?? "",
        hallAddress: data['hallAddress'] ?? "",
        hallPrice: data['hallPrice'] ?? "",
        hallPhone1: data['hallPhone1'] ?? "",
        hallPhone2: data['hallPhone2'] ?? "",
        hallPhone3: data['hallPhone3'] ?? "",
        hallFacebook: data['hallFacebook'] ?? "",
        hallWhatsApp: data['hallWhatsApp'] ?? "",
        hallLocation: data['hallLocation'] ?? "",
        hallCategory: data['hallCategory'] ?? "",
        hallRating: data['hallRating'] ?? "",
        hallCreated: data['hallCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        hallImages: doc.get('hallImages') ??  [],
        hallId: data['hallId'] ?? "",
      );
      return hall;
    } catch (e) {
      throw '❌ Error in HallModel.fromSnapshot : $e';
    }
  }

  factory HallModel.fromJson(Map<String, dynamic> json) {
    return HallModel(
      hallTitle: json['hallTitle'] as String,
      hallDescription: json['hallDescription'] as String,
      hallAddress: json['hallAddress'] as String,
      hallPrice: json['hallPrice'] as String,
      hallPhone1: json['hallPhone1'] as String?,
      hallPhone2: json['hallPhone2'] as String?,
      hallPhone3: json['hallPhone3'] as String?,
      hallFacebook: json['hallFacebook'] as String,
      hallWhatsApp: json['hallWhatsApp'] as String,
      hallLocation: json['hallLocation'] as String,
      hallCategory: json['hallCategory'] as String,
      hallRating: json['hallRating'] as String,
      hallCreated: json['hallCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      hallImages: List<String>.from(json['hallImages']) ,

      hallId: json['hallId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'hallTitle': hallTitle,
      'hallDescription': hallDescription,
      'hallAddress': hallAddress,
      'hallPrice': hallPrice,
      'hallPhone1': hallPhone1,
      'hallPhone2': hallPhone2,
      'hallPhone3': hallPhone3,
      'hallFacebook': hallFacebook,
      'hallWhatsApp': hallWhatsApp,
      'hallLocation': hallLocation,
      'hallCategory': hallCategory,
      'hallRating': hallRating,
      'hallCreated': hallCreated,
      'lastUpdate': lastUpdate,
      'hallImages': hallImages,
      'hallId': hallId,
    };
  }
}
