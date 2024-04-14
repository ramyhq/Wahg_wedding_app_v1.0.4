import 'package:equatable/equatable.dart';

import '../../../../const/app_enums.dart';

class AppOffer extends Equatable {
  final String offerId;
  final String offerTitle;
  final String offerDescription;
  final DateTime offerValidityDate;

  const AppOffer({
    required this.offerId,
    required this.offerTitle,
    required this.offerDescription,
    required this.offerValidityDate,
  });

  @override
  List<Object> get props =>
      [offerId, offerTitle, offerDescription, offerValidityDate,];

}