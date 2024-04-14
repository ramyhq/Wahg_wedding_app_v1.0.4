import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Hair extends Equatable {
  final String? hairTitle;
  final String? hairDescription;
  final String? hairAddress;
  final String? hairPrice;
  final String? hairPhone1;
  final String? hairPhone2;
  final String? hairPhone3;
  final String? hairFacebook;
  final String? hairWhatsApp;
  final String? hairLocation;
  final String? hairCategory;
  final String? hairRating;
  final DateTime? hairCreated;
  final DateTime? lastUpdate;
  final String? hairId;
  final List<String>? hairImages;


  const Hair({
    this.hairTitle,
    this.hairDescription,
    this.hairAddress,
    this.hairPrice,
    this.hairPhone1,
    this.hairPhone2,
    this.hairPhone3,
    this.hairFacebook,
    this.hairWhatsApp,
    this.hairLocation,
    this.hairCategory,
    this.hairRating,
    this.hairCreated,
    this.lastUpdate,
    this.hairId,
    this.hairImages,
  });

  @override
  List<Object?> get props =>
      [
        hairTitle,
        hairDescription,
        hairAddress,
        hairPrice,
        hairPhone1,
        hairPhone2,
        hairPhone3,
        hairFacebook,
        hairWhatsApp,
        hairLocation,
        hairCategory,
        hairRating,
        hairCreated,
        lastUpdate,
        hairId,
        hairImages,
      ];
}
