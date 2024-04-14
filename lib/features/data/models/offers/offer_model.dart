import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wahg_v1/features/domain/entities/offer_entity.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';

class OfferModel extends Offer {
  const OfferModel({
    required super.offerTitle,
    required super.offerDescription,
    required super.offerCategory,
    required super.createAt,
    required super.offerId,
    required super.offerImages,
  });

  factory OfferModel.fromSnapshot(DocumentSnapshot doc) {
    try {
      return OfferModel(
        offerTitle: doc.get('offerTitle') as String,
        offerDescription: doc.get('offerDescription') as String,
        offerCategory: doc.get('offerCategory') as String,
        createAt: doc.get('createAt').toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        offerImages: List<String>.from(doc.get('offerImages')),
        offerId: doc.id,
      );
    } catch (e) {
      print('555 Offers Remote Imp is :$e');

      throw '❌ Error in OfferModel.fromSnapshot : $e';
    }
  }

  // Anther Version for Testing
  factory OfferModel.fromSnapshot2(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    try {
      var offer = OfferModel(
        offerTitle: data['offerTitle'],
        offerDescription: data['offerDescription'] ?? "",
        offerCategory: data['offerCategory'] ?? "",
        createAt: data['createAt'].toDate() ??
            DateTime.parse("2000-01-01T00:00:00.000Z"),
        offerImages: doc.get('offerImages') ?? [],
        offerId: data['offerId'] ?? "",
      );
      return offer;
    } catch (e) {
      throw '❌ Error in OfferModel.fromSnapshot : $e';
    }
  }

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      offerTitle: json['offerTitle'] as String,
      offerDescription: json['offerDescription'] as String,
      offerCategory: json['offerCategory'] as String,
      createAt: json['createAt'] as DateTime,
      offerImages: List<String>.from(json['offerImages']),
      offerId: json['offerId'] as String,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'offerTitle': offerTitle,
      'offerDescription': offerDescription,
      'offerCategory': offerCategory,
      'createAt': createAt,
      'offerImages': offerImages,
      'offerId': offerId,
    };
  }
}
