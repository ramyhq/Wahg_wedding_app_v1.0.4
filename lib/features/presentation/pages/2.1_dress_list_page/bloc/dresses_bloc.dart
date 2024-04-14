import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/dress_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_dress_usecase.dart';


part 'dresses_event.dart';
part 'dresses_state.dart';

class DressesBloc extends Bloc<DressesEvent, DressesState> {
  DressesBloc() : super(DressesState()) {
    on<GetDressesListEvent>(_loadDressesList);
    on<OpenDressDetailsEvent>(_loadDressesDetails);
  }



  FutureOr<void> _loadDressesList(GetDressesListEvent event, Emitter<DressesState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetDressesUseCase(dressRepository: sl.call())
        .getDressesList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Dress is : ${state.dressesList}');
    }, (List<Dress> data) {
      print('1 Dress is : ${state.dressesList}');
      emit(state.copyWith(dressesList: data, requestState: RequestState.done));
      print('2 Dress is : ${state.dressesList}');
    });
  }

  FutureOr<void> _loadDressesDetails(OpenDressDetailsEvent event, Emitter<DressesState> emit) async{
    emit(state.copyWith(selectedDress: event.selectedDress));

  }
}

