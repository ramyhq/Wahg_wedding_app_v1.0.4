import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Hall extends Equatable {
  final String? hallTitle;
  final String? hallDescription;
  final String? hallAddress;
  final String? hallPrice;
  final String? hallPhone1;
  final String? hallPhone2;
  final String? hallPhone3;
  final String? hallFacebook;
  final String? hallWhatsApp;
  final String? hallLocation;
  final String? hallCategory;
  final String? hallRating;
  final DateTime? hallCreated;
  final DateTime? lastUpdate;
  final String? hallId;
  final List<String>? hallImages;


  const Hall({
    this.hallTitle,
    this.hallDescription,
    this.hallAddress,
    this.hallPrice,
    this.hallPhone1,
    this.hallPhone2,
    this.hallPhone3,
    this.hallFacebook,
    this.hallWhatsApp,
    this.hallLocation,
    this.hallCategory,
    this.hallRating,
    this.hallCreated,
    this.lastUpdate,
    this.hallId,
    this.hallImages,
  });

  @override
  List<Object?> get props =>
      [
        hallTitle,
        hallDescription,
        hallAddress,
        hallPrice,
        hallPhone1,
        hallPhone2,
        hallPhone3,
        hallFacebook,
        hallWhatsApp,
        hallLocation,
        hallCategory,
        hallRating,
        hallCreated,
        lastUpdate,
        hallId,
        hallImages,
      ];
}
