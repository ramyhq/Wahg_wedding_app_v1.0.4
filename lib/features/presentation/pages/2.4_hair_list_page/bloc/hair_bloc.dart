import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/hair_entity.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_hair_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';


part 'hair_event.dart';
part 'hair_state.dart';

class HairBloc extends Bloc<HairEvent, HairState> {
  HairBloc() : super(HairState()) {
    on<GetHairListEvent>(_loadHairList);
    on<OpenHairDetailsEvent>(_loadHairDetails);
  }



  FutureOr<void> _loadHairList(GetHairListEvent event, Emitter<HairState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetHairUseCase(hairRepository: sl.call())
        .getHairList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Hair is : ${state.hairList}');
    }, (List<Hair> data) {
      print('1 Hair is : ${state.hairList}');
      emit(state.copyWith(hairList: data, requestState: RequestState.done));
      print('2 Hair is : ${state.hairList}');
    });
  }

  FutureOr<void> _loadHairDetails(OpenHairDetailsEvent event, Emitter<HairState> emit) async{
    emit(state.copyWith(selectedHair: event.selectedHair));

  }
}

