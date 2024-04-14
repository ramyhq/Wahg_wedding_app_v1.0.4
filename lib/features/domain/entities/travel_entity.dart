import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Travel extends Equatable {
  final String? travelTitle;
  final String? travelDescription;
  final String? travelAddress;
  final String? travelPrice;
  final String? travelPhone1;
  final String? travelPhone2;
  final String? travelPhone3;
  final String? travelFacebook;
  final String? travelWhatsApp;
  final String? travelLocation;
  final String? travelCategory;
  final String? travelRating;
  final DateTime? travelCreated;
  final DateTime? lastUpdate;
  final String? travelId;
  final List<String>? travelImages;


  const Travel({
    this.travelTitle,
    this.travelDescription,
    this.travelAddress,
    this.travelPrice,
    this.travelPhone1,
    this.travelPhone2,
    this.travelPhone3,
    this.travelFacebook,
    this.travelWhatsApp,
    this.travelLocation,
    this.travelCategory,
    this.travelRating,
    this.travelCreated,
    this.lastUpdate,
    this.travelId,
    this.travelImages,
  });

  @override
  List<Object?> get props =>
      [
        travelTitle,
        travelDescription,
        travelAddress,
        travelPrice,
        travelPhone1,
        travelPhone2,
        travelPhone3,
        travelFacebook,
        travelWhatsApp,
        travelLocation,
        travelCategory,
        travelRating,
        travelCreated,
        lastUpdate,
        travelId,
        travelImages,
      ];
}
