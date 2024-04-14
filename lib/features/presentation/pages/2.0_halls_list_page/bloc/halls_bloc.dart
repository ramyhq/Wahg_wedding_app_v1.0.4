import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';


part 'halls_event.dart';
part 'halls_state.dart';

class HallsBloc extends Bloc<HallsEvent, HallsState> {
  HallsBloc() : super(HallsState()) {
    on<GetHallsListEvent>(_loadHallsList);
    on<OpenHallDetailsEvent>(_loadHallDetails);
  }



  FutureOr<void> _loadHallsList(GetHallsListEvent event, Emitter<HallsState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

     final res = await GetHallUseCase(hallRepository: sl.call())
        .getHallsList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Hall is : ${state.hallsList}');
    }, (List<Hall> data) {
      print('1 Hall is : ${state.hallsList}');
      emit(state.copyWith(hallsList: data, requestState: RequestState.done));
      print('2 Hall is : ${state.hallsList}');
    });
  }

  FutureOr<void> _loadHallDetails(OpenHallDetailsEvent event, Emitter<HallsState> emit) async{
    emit(state.copyWith(selectedHall: event.selectedHall));

  }
}

