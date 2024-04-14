import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/travel_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_travel_usecase.dart';


part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(TravelState()) {
    on<GetTravelListEvent>(_loadTravelList);
    on<OpenTravelDetailsEvent>(_loadTravelDetails);
  }



  FutureOr<void> _loadTravelList(GetTravelListEvent event, Emitter<TravelState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetTravelUseCase(travelRepository: sl.call())
        .getTravelList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Travel is : ${state.travelList}');
    }, (List<Travel> data) {
      print('1 Travel is : ${state.travelList}');
      emit(state.copyWith(travelList: data, requestState: RequestState.done));
      print('2 Travel is : ${state.travelList}');
    });
  }

  FutureOr<void> _loadTravelDetails(OpenTravelDetailsEvent event, Emitter<TravelState> emit) async{
    emit(state.copyWith(selectedTravel: event.selectedTravel));

  }
}

