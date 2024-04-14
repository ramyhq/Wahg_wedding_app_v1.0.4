import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

class PhotographerModel extends Photographer {
  const PhotographerModel({
    required super.photographerTitle,
    required super.photographerDescription,
    required super.photographerAddress,
    required super.photographerPrice,
    required super.photographerPhone1,
    required super.photographerPhone2,
    required super.photographerPhone3,
    required super.photographerFacebook,
    required super.photographerWhatsApp,
    required super.photographerLocation,
    required super.photographerCategory,
    required super.photographerRating,
    required super.photographerCreated,
    required super.lastUpdate,
    required super.photographerId,
    required super.photographerImages,
  });

  factory PhotographerModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return PhotographerModel(
        photographerTitle: doc.get('photographerTitle') as String,
        photographerDescription: doc.get('photographerDescription') as String,
        photographerAddress: doc.get('photographerAddress') as String,
        photographerPrice: doc.get('photographerPrice') as String,
        photographerPhone1: doc.get('photographerPhone1') as String,
        photographerPhone2: doc.get('photographerPhone2') as String,
        photographerPhone3: doc.get('photographerPhone3') as String,
        photographerFacebook: doc.get('photographerFacebook') as String,
        photographerWhatsApp: doc.get('photographerWhatsApp') as String,
        photographerLocation: doc.get('photographerLocation') as String,
        photographerCategory: doc.get('photographerCategory') as String,
        photographerRating: doc.get('photographerRating') as String,
        photographerCreated: doc.get('photographerCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        photographerImages: List<String>.from(doc.get('photographerImages')) ,

        photographerId: doc.id,
      );
    } catch (e) {
      print('555 photographers Remote Imp is :$e');

      throw '❌ Error in PhotographerModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory PhotographerModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var photographer = PhotographerModel(
        photographerTitle: data['photographerTitle'],
        photographerDescription: data['photographerDescription'] ?? "",
        photographerAddress: data['photographerAddress'] ?? "",
        photographerPrice: data['photographerPrice'] ?? "",
        photographerPhone1: data['photographerPhone1'] ?? "",
        photographerPhone2: data['photographerPhone2'] ?? "",
        photographerPhone3: data['photographerPhone3'] ?? "",
        photographerFacebook: data['photographerFacebook'] ?? "",
        photographerWhatsApp: data['photographerWhatsApp'] ?? "",
        photographerLocation: data['photographerLocation'] ?? "",
        photographerCategory: data['photographerCategory'] ?? "",
        photographerRating: data['photographerRating'] ?? "",
        photographerCreated: data['photographerCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        photographerImages: doc.get('photographerImages') ??  [],
        photographerId: data['photographerId'] ?? "",
      );
      return photographer;
    } catch (e) {
      throw '❌ Error in PhotographerModel.fromSnapshot : $e';
    }
  }

  factory PhotographerModel.fromJson(Map<String, dynamic> json) {
    return PhotographerModel(
      photographerTitle: json['photographerTitle'] as String,
      photographerDescription: json['photographerDescription'] as String,
      photographerAddress: json['photographerAddress'] as String,
      photographerPrice: json['photographerPrice'] as String,
      photographerPhone1: json['photographerPhone1'] as String?,
      photographerPhone2: json['photographerPhone2'] as String?,
      photographerPhone3: json['photographerPhone3'] as String?,
      photographerFacebook: json['photographerFacebook'] as String,
      photographerWhatsApp: json['photographerWhatsApp'] as String,
      photographerLocation: json['photographerLocation'] as String,
      photographerCategory: json['photographerCategory'] as String,
      photographerRating: json['photographerRating'] as String,
      photographerCreated: json['photographerCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      photographerImages: List<String>.from(json['photographerImages']) ,

      photographerId: json['photographerId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'photographerTitle': photographerTitle,
      'photographerDescription': photographerDescription,
      'photographerAddress': photographerAddress,
      'photographerPrice': photographerPrice,
      'photographerPhone1': photographerPhone1,
      'photographerPhone2': photographerPhone2,
      'photographerPhone3': photographerPhone3,
      'photographerFacebook': photographerFacebook,
      'photographerWhatsApp': photographerWhatsApp,
      'photographerLocation': photographerLocation,
      'photographerCategory': photographerCategory,
      'photographerRating': photographerRating,
      'photographerCreated': photographerCreated,
      'lastUpdate': lastUpdate,
      'photographerImages': photographerImages,
      'photographerId': photographerId,
    };
  }
}
