import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_photographer_usecase.dart';


part 'photographer_event.dart';
part 'photographer_state.dart';

class PhotographerBloc extends Bloc<PhotographerEvent, PhotographerState> {
  PhotographerBloc() : super(PhotographerState()) {
    on<GetPhotographerListEvent>(_loadPhotographerList);
    on<OpenPhotographerDetailsEvent>(_loadPhotographerDetails);
  }



  FutureOr<void> _loadPhotographerList(GetPhotographerListEvent event, Emitter<PhotographerState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetPhotographerUseCase(photographerRepository: sl.call())
        .getPhotographerList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Photographer is : ${state.photographerList}');
    }, (List<Photographer> data) {
      print('1 Photographer is : ${state.photographerList}');
      emit(state.copyWith(photographerList: data, requestState: RequestState.done));
      print('2 Photographer is : ${state.photographerList}');
    });
  }

  FutureOr<void> _loadPhotographerDetails(OpenPhotographerDetailsEvent event, Emitter<PhotographerState> emit) async{
    emit(state.copyWith(selectedPhotographer: event.selectedPhotographer));

  }
}

