import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class Offer extends Equatable {
  final String? offerTitle;
  final String? offerDescription;
  final String? offerCategory;
  final DateTime? createAt;
  final String? offerId;
  final List<String>? offerImages;

  const Offer({
    this.offerTitle,
    this.offerDescription,
    this.offerCategory,
    this.createAt,
    this.offerId,
    this.offerImages,
  });

  @override
  List<Object?> get props => [
        offerTitle,
        offerDescription,
        offerCategory,
        createAt,
        offerId,
        offerImages,
      ];
}
