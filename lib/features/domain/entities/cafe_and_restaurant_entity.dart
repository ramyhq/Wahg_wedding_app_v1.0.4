import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class CafeAndRestaurant extends Equatable {
  final String? cafeAndRestaurantTitle;
  final String? cafeAndRestaurantDescription;
  final String? cafeAndRestaurantAddress;
  final String? cafeAndRestaurantPrice;
  final String? cafeAndRestaurantPhone1;
  final String? cafeAndRestaurantPhone2;
  final String? cafeAndRestaurantPhone3;
  final String? cafeAndRestaurantFacebook;
  final String? cafeAndRestaurantWhatsApp;
  final String? cafeAndRestaurantLocation;
  final String? cafeAndRestaurantCategory;
  final String? cafeAndRestaurantRating;
  final DateTime? cafeAndRestaurantCreated;
  final DateTime? lastUpdate;
  final String? cafeAndRestaurantId;
  final List<String>? cafeAndRestaurantImages;


  const CafeAndRestaurant({
    this.cafeAndRestaurantTitle,
    this.cafeAndRestaurantDescription,
    this.cafeAndRestaurantAddress,
    this.cafeAndRestaurantPrice,
    this.cafeAndRestaurantPhone1,
    this.cafeAndRestaurantPhone2,
    this.cafeAndRestaurantPhone3,
    this.cafeAndRestaurantFacebook,
    this.cafeAndRestaurantWhatsApp,
    this.cafeAndRestaurantLocation,
    this.cafeAndRestaurantCategory,
    this.cafeAndRestaurantRating,
    this.cafeAndRestaurantCreated,
    this.lastUpdate,
    this.cafeAndRestaurantId,
    this.cafeAndRestaurantImages,
  });

  @override
  List<Object?> get props =>
      [
        cafeAndRestaurantTitle,
        cafeAndRestaurantDescription,
        cafeAndRestaurantAddress,
        cafeAndRestaurantPrice,
        cafeAndRestaurantPhone1,
        cafeAndRestaurantPhone2,
        cafeAndRestaurantPhone3,
        cafeAndRestaurantFacebook,
        cafeAndRestaurantWhatsApp,
        cafeAndRestaurantLocation,
        cafeAndRestaurantCategory,
        cafeAndRestaurantRating,
        cafeAndRestaurantCreated,
        lastUpdate,
        cafeAndRestaurantId,
        cafeAndRestaurantImages,
      ];
}
