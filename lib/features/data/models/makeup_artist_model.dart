import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';

class MakeupArtistModel extends MakeupArtist {
  const MakeupArtistModel({
    required super.makeupArtistTitle,
    required super.makeupArtistDescription,
    required super.makeupArtistAddress,
    required super.makeupArtistPrice,
    required super.makeupArtistPhone1,
    required super.makeupArtistPhone2,
    required super.makeupArtistPhone3,
    required super.makeupArtistFacebook,
    required super.makeupArtistWhatsApp,
    required super.makeupArtistLocation,
    required super.makeupArtistCategory,
    required super.makeupArtistRating,
    required super.makeupArtistCreated,
    required super.lastUpdate,
    required super.makeupArtistId,
    required super.makeupArtistImages,
  });

  factory MakeupArtistModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return MakeupArtistModel(
        makeupArtistTitle: doc.get('makeupArtistTitle') as String,
        makeupArtistDescription: doc.get('makeupArtistDescription') as String,
        makeupArtistAddress: doc.get('makeupArtistAddress') as String,
        makeupArtistPrice: doc.get('makeupArtistPrice') as String,
        makeupArtistPhone1: doc.get('makeupArtistPhone1') as String,
        makeupArtistPhone2: doc.get('makeupArtistPhone2') as String,
        makeupArtistPhone3: doc.get('makeupArtistPhone3') as String,
        makeupArtistFacebook: doc.get('makeupArtistFacebook') as String,
        makeupArtistWhatsApp: doc.get('makeupArtistWhatsApp') as String,
        makeupArtistLocation: doc.get('makeupArtistLocation') as String,
        makeupArtistCategory: doc.get('makeupArtistCategory') as String,
        makeupArtistRating: doc.get('makeupArtistRating') as String,
        makeupArtistCreated: doc.get('makeupArtistCreated').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: doc.get('lastUpdate').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        makeupArtistImages: List<String>.from(doc.get('makeupArtistImages')) ,

        makeupArtistId: doc.id,
      );
    } catch (e) {
      print('555 MakeupArtists Remote Imp is :$e');

      throw '❌ Error in MakeupArtistModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory MakeupArtistModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var makeupArtist = MakeupArtistModel(
        makeupArtistTitle: data['makeupArtistTitle'],
        makeupArtistDescription: data['makeupArtistDescription'] ?? "",
        makeupArtistAddress: data['makeupArtistAddress'] ?? "",
        makeupArtistPrice: data['makeupArtistPrice'] ?? "",
        makeupArtistPhone1: data['makeupArtistPhone1'] ?? "",
        makeupArtistPhone2: data['makeupArtistPhone2'] ?? "",
        makeupArtistPhone3: data['makeupArtistPhone3'] ?? "",
        makeupArtistFacebook: data['makeupArtistFacebook'] ?? "",
        makeupArtistWhatsApp: data['makeupArtistWhatsApp'] ?? "",
        makeupArtistLocation: data['makeupArtistLocation'] ?? "",
        makeupArtistCategory: data['makeupArtistCategory'] ?? "",
        makeupArtistRating: data['makeupArtistRating'] ?? "",
        makeupArtistCreated: data['makeupArtistCreated'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        lastUpdate: data['lastUpdate'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        makeupArtistImages: doc.get('makeupArtistImages') ??  [],
        makeupArtistId: data['makeupArtistId'] ?? "",
      );
      return makeupArtist;
    } catch (e) {
      throw '❌ Error in MakeupArtistModel.fromSnapshot : $e';
    }
  }

  factory MakeupArtistModel.fromJson(Map<String, dynamic> json) {
    return MakeupArtistModel(
      makeupArtistTitle: json['makeupArtistTitle'] as String,
      makeupArtistDescription: json['makeupArtistDescription'] as String,
      makeupArtistAddress: json['makeupArtistAddress'] as String,
      makeupArtistPrice: json['makeupArtistPrice'] as String,
      makeupArtistPhone1: json['makeupArtistPhone1'] as String?,
      makeupArtistPhone2: json['makeupArtistPhone2'] as String?,
      makeupArtistPhone3: json['makeupArtistPhone3'] as String?,
      makeupArtistFacebook: json['makeupArtistFacebook'] as String,
      makeupArtistWhatsApp: json['makeupArtistWhatsApp'] as String,
      makeupArtistLocation: json['makeupArtistLocation'] as String,
      makeupArtistCategory: json['makeupArtistCategory'] as String,
      makeupArtistRating: json['makeupArtistRating'] as String,
      makeupArtistCreated: json['makeupArtistCreated'] as DateTime,
      lastUpdate: json['lastUpdate'] as DateTime,
      makeupArtistImages: List<String>.from(json['makeupArtistImages']) ,

      makeupArtistId: json['makeupArtistId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'makeupArtistTitle': makeupArtistTitle,
      'makeupArtistDescription': makeupArtistDescription,
      'makeupArtistAddress': makeupArtistAddress,
      'makeupArtistPrice': makeupArtistPrice,
      'makeupArtistPhone1': makeupArtistPhone1,
      'makeupArtistPhone2': makeupArtistPhone2,
      'makeupArtistPhone3': makeupArtistPhone3,
      'makeupArtistFacebook': makeupArtistFacebook,
      'makeupArtistWhatsApp': makeupArtistWhatsApp,
      'makeupArtistLocation': makeupArtistLocation,
      'makeupArtistCategory': makeupArtistCategory,
      'makeupArtistRating': makeupArtistRating,
      'makeupArtistCreated': makeupArtistCreated,
      'lastUpdate': lastUpdate,
      'makeupArtistImages': makeupArtistImages,
      'makeupArtistId': makeupArtistId,
    };
  }
}
