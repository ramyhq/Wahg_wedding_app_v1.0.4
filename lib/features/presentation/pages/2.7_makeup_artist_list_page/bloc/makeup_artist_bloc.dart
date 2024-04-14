import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:wahg_v1/const/app_enums.dart';
import 'package:wahg_v1/di/injection_container.dart';
import 'package:wahg_v1/features/domain/entities/hall_entity.dart';
import 'package:wahg_v1/features/domain/entities/makeup_artist_entity.dart';
import 'package:wahg_v1/features/domain/usecases/get_hall_usecase.dart';
import 'package:wahg_v1/features/domain/usecases/get_makeup_artist_usecase.dart';


part 'makeup_artist_event.dart';
part 'makeup_artist_state.dart';

class MakeupArtistBloc extends Bloc<MakeupArtistEvent, MakeupArtistState> {
  MakeupArtistBloc() : super(MakeupArtistState()) {
    on<GetMakeupArtistListEvent>(_loadMakeupArtistList);
    on<OpenMakeupArtistDetailsEvent>(_loadMakeupArtistDetails);
  }



  FutureOr<void> _loadMakeupArtistList(GetMakeupArtistListEvent event, Emitter<MakeupArtistState> emit) async{
    emit(state.copyWith(requestState: RequestState.loading));

    final res = await GetMakeupArtistUseCase(makeupArtistRepository: sl.call())
        .getMakeupArtistList();

    res.fold((failure) {
      emit(state.copyWith(requestState: RequestState.error));
      print('0 MakeupArtist is : ${state.makeupArtistList}');
    }, (List<MakeupArtist> data) {
      print('1 MakeupArtist is : ${state.makeupArtistList}');
      emit(state.copyWith(makeupArtistList: data, requestState: RequestState.done));
      print('2 MakeupArtist is : ${state.makeupArtistList}');
    });
  }

  FutureOr<void> _loadMakeupArtistDetails(OpenMakeupArtistDetailsEvent event, Emitter<MakeupArtistState> emit) async{
    emit(state.copyWith(selectedMakeupArtist: event.selectedMakeupArtist));

  }
}

