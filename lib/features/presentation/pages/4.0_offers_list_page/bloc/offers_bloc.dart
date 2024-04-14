import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/offers/offer_entity.dart';
import 'package:wahg_v1/features/domain/usecases/offers/get_offer_usecase.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersState()) {
    on<GetOffersListEvent>(_loadOffersList);
    on<OpenOfferDetailsEvent>(_loadOfferDetails);
  }

  FutureOr<void> _loadOffersList(
      GetOffersListEvent event, Emitter<OffersState> emit) async {
    emit(state.copyWith(requestState: RequestState.loading));
    final res =
        await GetOfferUseCase(offerRepository: sl.call()).getOffersList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Offer is : ${state.offersList}');
    }, (List<Offer> data) {
      print('1 Offer is : ${state.offersList}');
      emit(state.copyWith(offersList: data, requestState: RequestState.done));
      print('2 Offer is : ${state.offersList}');
    });
  }

  FutureOr<void> _loadOfferDetails(
      OpenOfferDetailsEvent event, Emitter<OffersState> emit) async {
    emit(state.copyWith(selectedOffer: event.selectedOffer));
  }
}
