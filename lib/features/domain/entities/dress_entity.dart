import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Dress extends Equatable {
  final String? dressTitle;
  final String? dressDescription;
  final String? dressAddress;
  final String? dressPrice;
  final String? dressPhone1;
  final String? dressPhone2;
  final String? dressPhone3;
  final String? dressFacebook;
  final String? dressWhatsApp;
  final String? dressLocation;
  final String? dressCategory;
  final String? dressRating;
  final DateTime? dressCreated;
  final DateTime? lastUpdate;
  final String? dressId;
  final List<String>? dressImages;


  const Dress({
    this.dressTitle,
    this.dressDescription,
    this.dressAddress,
    this.dressPrice,
    this.dressPhone1,
    this.dressPhone2,
    this.dressPhone3,
    this.dressFacebook,
    this.dressWhatsApp,
    this.dressLocation,
    this.dressCategory,
    this.dressRating,
    this.dressCreated,
    this.lastUpdate,
    this.dressId,
    this.dressImages,
  });

  @override
  List<Object?> get props =>
      [
        dressTitle,
        dressDescription,
        dressAddress,
        dressPrice,
        dressPhone1,
        dressPhone2,
        dressPhone3,
        dressFacebook,
        dressWhatsApp,
        dressLocation,
        dressCategory,
        dressRating,
        dressCreated,
        lastUpdate,
        dressId,
        dressImages,
      ];
}
