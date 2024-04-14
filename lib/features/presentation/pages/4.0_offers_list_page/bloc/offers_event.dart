// ignore_for_file: must_be_immutable

part of 'offers_bloc.dart';

@immutable
abstract class OffersEvent extends Equatable {}

class GetOffersListEvent extends OffersEvent {
  @override
  List<Object> get props => [];
}

class OpenOfferDetailsEvent extends OffersEvent {
  Offer selectedOffer;

  OpenOfferDetailsEvent(
    this.selectedOffer,
  );
  @override
  List<Object> get props => [selectedOffer];
}
