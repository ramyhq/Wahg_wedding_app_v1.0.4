import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/suit_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_suit_usecase.dart';


part 'suit_event.dart';
part 'suit_state.dart';

class SuitBloc extends Bloc<SuitEvent, SuitState> {
  SuitBloc() : super(SuitState()) {
    on<GetSuitListEvent>(_loadSuitList);
    on<OpenSuitDetailsEvent>(_loadSuitDetails);
  }



  FutureOr<void> _loadSuitList(GetSuitListEvent event, Emitter<SuitState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetSuitUseCase(suitRepository: sl.call())
        .getSuitsList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 Suit is : ${state.suitsList}');
    }, (List<Suit> data) {
      print('1 Suit is : ${state.suitsList}');
      emit(state.copyWith(suitsList: data, requestState: RequestState.done));
      print('2 Suit is : ${state.suitsList}');
    });
  }

  FutureOr<void> _loadSuitDetails(OpenSuitDetailsEvent event, Emitter<SuitState> emit) async{
    emit(state.copyWith(selectedSuit: event.selectedSuit));

  }
}

