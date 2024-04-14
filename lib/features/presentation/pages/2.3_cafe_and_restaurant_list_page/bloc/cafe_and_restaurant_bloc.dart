import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/cafe_and_restaurant_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_cafe_and_restaurant_usecase.dart';


part 'cafe_and_restaurant_event.dart';
part 'cafe_and_restaurant_state.dart';

class CafeAndRestaurantBloc extends Bloc<CafeAndRestaurantEvent, CafeAndRestaurantState> {
  CafeAndRestaurantBloc() : super(CafeAndRestaurantState()) {
    on<GetCafeAndRestaurantListEvent>(_loadCafeAndRestaurantList);
    on<OpenCafeAndRestaurantDetailsEvent>(_loadCafeAndRestaurantDetails);
  }



  FutureOr<void> _loadCafeAndRestaurantList(GetCafeAndRestaurantListEvent event, Emitter<CafeAndRestaurantState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetCafeAndRestaurantUseCase(cafeAndRestaurantRepository: sl.call())
        .getCafeAndRestaurantList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 CafeAndRestaurant is : ${state.cafeAndRestaurantList}');
    }, (List<CafeAndRestaurant> data) {
      print('1 CafeAndRestaurant is : ${state.cafeAndRestaurantList}');
      emit(state.copyWith(cafeAndRestaurantList: data, requestState: RequestState.done));
      print('2 CafeAndRestaurant is : ${state.cafeAndRestaurantList}');
    });
  }

  FutureOr<void> _loadCafeAndRestaurantDetails(OpenCafeAndRestaurantDetailsEvent event, Emitter<CafeAndRestaurantState> emit) async{
    emit(state.copyWith(selectedCafeAndRestaurant: event.selectedCafeAndRestaurant));

  }
}

