import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Photographer extends Equatable {
  final String? photographerTitle;
  final String? photographerDescription;
  final String? photographerAddress;
  final String? photographerPrice;
  final String? photographerPhone1;
  final String? photographerPhone2;
  final String? photographerPhone3;
  final String? photographerFacebook;
  final String? photographerWhatsApp;
  final String? photographerLocation;
  final String? photographerCategory;
  final String? photographerRating;
  final DateTime? photographerCreated;
  final DateTime? lastUpdate;
  final String? photographerId;
  final List<String>? photographerImages;


  const Photographer({
    this.photographerTitle,
    this.photographerDescription,
    this.photographerAddress,
    this.photographerPrice,
    this.photographerPhone1,
    this.photographerPhone2,
    this.photographerPhone3,
    this.photographerFacebook,
    this.photographerWhatsApp,
    this.photographerLocation,
    this.photographerCategory,
    this.photographerRating,
    this.photographerCreated,
    this.lastUpdate,
    this.photographerId,
    this.photographerImages,
  });

  @override
  List<Object?> get props =>
      [
        photographerTitle,
        photographerDescription,
        photographerAddress,
        photographerPrice,
        photographerPhone1,
        photographerPhone2,
        photographerPhone3,
        photographerFacebook,
        photographerWhatsApp,
        photographerLocation,
        photographerCategory,
        photographerRating,
        photographerCreated,
        lastUpdate,
        photographerId,
        photographerImages,
      ];
}
