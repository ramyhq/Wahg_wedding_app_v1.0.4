// ignore_for_file: must_be_immutable
part of 'offers_bloc.dart';

class OffersState extends Equatable {
  List<Offer> offersList;
  Offer selectedOffer;
  RequestState? requestState;

  OffersState({
    this.selectedOffer = const Offer(),
    this.offersList = const[],
    this.requestState = RequestState.initial,
  });

  OffersState copyWith({
    List<Offer>? offersList,
    Offer? selectedOffer,
    RequestState? requestState,
  }) {
    return OffersState(
      offersList: offersList ?? this.offersList,
      selectedOffer: selectedOffer ?? this.selectedOffer,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,offersList,selectedOffer];
}


