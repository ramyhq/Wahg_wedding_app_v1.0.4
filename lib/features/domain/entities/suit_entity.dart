import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Suit extends Equatable {
  final String? suitTitle;
  final String? suitDescription;
  final String? suitAddress;
  final String? suitPrice;
  final String? suitPhone1;
  final String? suitPhone2;
  final String? suitPhone3;
  final String? suitFacebook;
  final String? suitWhatsApp;
  final String? suitLocation;
  final String? suitCategory;
  final String? suitRating;
  final DateTime? suitCreated;
  final DateTime? lastUpdate;
  final String? suitId;
  final List<String>? suitImages;


  const Suit({
    this.suitTitle,
    this.suitDescription,
    this.suitAddress,
    this.suitPrice,
    this.suitPhone1,
    this.suitPhone2,
    this.suitPhone3,
    this.suitFacebook,
    this.suitWhatsApp,
    this.suitLocation,
    this.suitCategory,
    this.suitRating,
    this.suitCreated,
    this.lastUpdate,
    this.suitId,
    this.suitImages,
  });

  @override
  List<Object?> get props =>
      [
        suitTitle,
        suitDescription,
        suitAddress,
        suitPrice,
        suitPhone1,
        suitPhone2,
        suitPhone3,
        suitFacebook,
        suitWhatsApp,
        suitLocation,
        suitCategory,
        suitRating,
        suitCreated,
        lastUpdate,
        suitId,
        suitImages,
      ];
}
