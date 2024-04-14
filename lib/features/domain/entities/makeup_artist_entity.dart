import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class MakeupArtist extends Equatable {
  final String? makeupArtistTitle;
  final String? makeupArtistDescription;
  final String? makeupArtistAddress;
  final String? makeupArtistPrice;
  final String? makeupArtistPhone1;
  final String? makeupArtistPhone2;
  final String? makeupArtistPhone3;
  final String? makeupArtistFacebook;
  final String? makeupArtistWhatsApp;
  final String? makeupArtistLocation;
  final String? makeupArtistCategory;
  final String? makeupArtistRating;
  final DateTime? makeupArtistCreated;
  final DateTime? lastUpdate;
  final String? makeupArtistId;
  final List<String>? makeupArtistImages;


  const MakeupArtist({
    this.makeupArtistTitle,
    this.makeupArtistDescription,
    this.makeupArtistAddress,
    this.makeupArtistPrice,
    this.makeupArtistPhone1,
    this.makeupArtistPhone2,
    this.makeupArtistPhone3,
    this.makeupArtistFacebook,
    this.makeupArtistWhatsApp,
    this.makeupArtistLocation,
    this.makeupArtistCategory,
    this.makeupArtistRating,
    this.makeupArtistCreated,
    this.lastUpdate,
    this.makeupArtistId,
    this.makeupArtistImages,
  });

  @override
  List<Object?> get props =>
      [
        makeupArtistTitle,
        makeupArtistDescription,
        makeupArtistAddress,
        makeupArtistPrice,
        makeupArtistPhone1,
        makeupArtistPhone2,
        makeupArtistPhone3,
        makeupArtistFacebook,
        makeupArtistWhatsApp,
        makeupArtistLocation,
        makeupArtistCategory,
        makeupArtistRating,
        makeupArtistCreated,
        lastUpdate,
        makeupArtistId,
        makeupArtistImages,
      ];
}
