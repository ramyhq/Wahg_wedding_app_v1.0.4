import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';

class TravelModel extends Travel {
  const TravelModel({
    required super.travelTitle,
    required super.travelDescription,
    required super.travelAddress,
    required super.travelPrice,
    required super.travelPhone1,
    required super.travelPhone2,
    required super.travelPhone3,
    required super.travelFacebook,
    required super.travelWhatsApp,
    required super.travelLocation,
    required super.travelCategory,
    required super.travelRating,
    required super.travelCreated,
    required super.lastUpdate,
    required super.travelId,
    required super.travelImages,
  });

  factory TravelModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return TravelModel(
        travelTitle: doc.get('travelTitle') as String,
        travelDescription: doc.get('travelDescription') as String,
        travelAddress: doc.get('travelAddress') as String,
        travelPrice: doc.get('travelPrice') as String,
        travelPhone1: doc.get('travelPhone1') as String,
        travelPhone2: doc.get('travelPhone2') as String,
        travelPhone3: doc.get('travelPhone3') as String,
        travelFacebook: doc.get('travelFacebook') as String,
        travelWhatsApp: doc.get('travelWhatsApp') as String,
        travelLocation: doc.get('travelLocation') as String,
        travelCategory: doc.get('travelCategory') as String,
        travelRating: doc.get('travelRating') as String,
        travelCreated: doc.get('travelCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        travelImages: List<String>.from(doc.get('travelImages')) ,

        travelId: doc.id,
      );
    } catch (e) {
      print('555 Travels Remote Imp is :$e');

      throw '❌ Error in TravelModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory TravelModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var travel = TravelModel(
        travelTitle: data['travelTitle'],
        travelDescription: data['travelDescription'] ?? "",
        travelAddress: data['travelAddress'] ?? "",
        travelPrice: data['travelPrice'] ?? "",
        travelPhone1: data['travelPhone1'] ?? "",
        travelPhone2: data['travelPhone2'] ?? "",
        travelPhone3: data['travelPhone3'] ?? "",
        travelFacebook: data['travelFacebook'] ?? "",
        travelWhatsApp: data['travelWhatsApp'] ?? "",
        travelLocation: data['travelLocation'] ?? "",
        travelCategory: data['travelCategory'] ?? "",
        travelRating: data['travelRating'] ?? "",
        travelCreated: data['travelCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        travelImages: doc.get('travelImages') ??  [],
        travelId: data['travelId'] ?? "",
      );
      return travel;
    } catch (e) {
      throw '❌ Error in TravelModel.fromSnapshot : $e';
    }
  }

  factory TravelModel.fromJson(Map<String, dynamic> json) {
    return TravelModel(
      travelTitle: json['travelTitle'] as String,
      travelDescription: json['travelDescription'] as String,
      travelAddress: json['travelAddress'] as String,
      travelPrice: json['travelPrice'] as String,
      travelPhone1: json['travelPhone1'] as String?,
      travelPhone2: json['travelPhone2'] as String?,
      travelPhone3: json['travelPhone3'] as String?,
      travelFacebook: json['travelFacebook'] as String,
      travelWhatsApp: json['travelWhatsApp'] as String,
      travelLocation: json['travelLocation'] as String,
      travelCategory: json['travelCategory'] as String,
      travelRating: json['travelRating'] as String,
      travelCreated: json['travelCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      travelImages: List<String>.from(json['travelImages']) ,

      travelId: json['travelId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'travelTitle': travelTitle,
      'travelDescription': travelDescription,
      'travelAddress': travelAddress,
      'travelPrice': travelPrice,
      'travelPhone1': travelPhone1,
      'travelPhone2': travelPhone2,
      'travelPhone3': travelPhone3,
      'travelFacebook': travelFacebook,
      'travelWhatsApp': travelWhatsApp,
      'travelLocation': travelLocation,
      'travelCategory': travelCategory,
      'travelRating': travelRating,
      'travelCreated': travelCreated,
      'lastUpdate': lastUpdate,
      'travelImages': travelImages,
      'travelId': travelId,
    };
  }
}
