import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';

class DressModel extends Dress {
  const DressModel({
    required super.dressTitle,
    required super.dressDescription,
    required super.dressAddress,
    required super.dressPrice,
    required super.dressPhone1,
    required super.dressPhone2,
    required super.dressPhone3,
    required super.dressFacebook,
    required super.dressWhatsApp,
    required super.dressLocation,
    required super.dressCategory,
    required super.dressRating,
    required super.dressCreated,
    required super.lastUpdate,
    required super.dressId,
    required super.dressImages,
  });

  factory DressModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return DressModel(
        dressTitle: doc.get('dressTitle') as String,
        dressDescription: doc.get('dressDescription') as String,
        dressAddress: doc.get('dressAddress') as String,
        dressPrice: doc.get('dressPrice') as String,
        dressPhone1: doc.get('dressPhone1') as String,
        dressPhone2: doc.get('dressPhone2') as String,
        dressPhone3: doc.get('dressPhone3') as String,
        dressFacebook: doc.get('dressFacebook') as String,
        dressWhatsApp: doc.get('dressWhatsApp') as String,
        dressLocation: doc.get('dressLocation') as String,
        dressCategory: doc.get('dressCategory') as String,
        dressRating: doc.get('dressRating') as String,
        dressCreated: doc.get('dressCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        dressImages: List<String>.from(doc.get('dressImages')) ,

        dressId: doc.id,
      );
    } catch (e) {
      print('555 dresss Remote Imp is :$e');

      throw '❌ Error in DressModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory DressModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var dress = DressModel(
        dressTitle: data['dressTitle'],
        dressDescription: data['dressDescription'] ?? "",
        dressAddress: data['dressAddress'] ?? "",
        dressPrice: data['dressPrice'] ?? "",
        dressPhone1: data['dressPhone1'] ?? "",
        dressPhone2: data['dressPhone2'] ?? "",
        dressPhone3: data['dressPhone3'] ?? "",
        dressFacebook: data['dressFacebook'] ?? "",
        dressWhatsApp: data['dressWhatsApp'] ?? "",
        dressLocation: data['dressLocation'] ?? "",
        dressCategory: data['dressCategory'] ?? "",
        dressRating: data['dressRating'] ?? "",
        dressCreated: data['dressCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        dressImages: doc.get('dressImages') ??  [],
        dressId: data['dressId'] ?? "",
      );
      return dress;
    } catch (e) {
      throw '❌ Error in DressModel.fromSnapshot : $e';
    }
  }

  factory DressModel.fromJson(Map<String, dynamic> json) {
    return DressModel(
      dressTitle: json['dressTitle'] as String,
      dressDescription: json['dressDescription'] as String,
      dressAddress: json['dressAddress'] as String,
      dressPrice: json['dressPrice'] as String,
      dressPhone1: json['dressPhone1'] as String?,
      dressPhone2: json['dressPhone2'] as String?,
      dressPhone3: json['dressPhone3'] as String?,
      dressFacebook: json['dressFacebook'] as String,
      dressWhatsApp: json['dressWhatsApp'] as String,
      dressLocation: json['dressLocation'] as String,
      dressCategory: json['dressCategory'] as String,
      dressRating: json['dressRating'] as String,
      dressCreated: json['dressCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      dressImages: List<String>.from(json['dressImages']) ,

      dressId: json['dressId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'dressTitle': dressTitle,
      'dressDescription': dressDescription,
      'dressAddress': dressAddress,
      'dressPrice': dressPrice,
      'dressPhone1': dressPhone1,
      'dressPhone2': dressPhone2,
      'dressPhone3': dressPhone3,
      'dressFacebook': dressFacebook,
      'dressWhatsApp': dressWhatsApp,
      'dressLocation': dressLocation,
      'dressCategory': dressCategory,
      'dressRating': dressRating,
      'dressCreated': dressCreated,
      'lastUpdate': lastUpdate,
      'dressImages': dressImages,
      'dressId': dressId,
    };
  }
}
