// ignore_for_file: must_be_immutable
part of 'photographer_bloc.dart';

class PhotographerState extends Equatable {
  List<Photographer> photographerList;
  Photographer selectedPhotographer;
  RequestState? requestState;

  PhotographerState({
    this.selectedPhotographer = const Photographer(),
    this.photographerList = const[],
    this.requestState = RequestState.initial,
  });

  PhotographerState copyWith({
    List<Photographer>? photographerList,
    Photographer? selectedPhotographer,
    RequestState? requestState,
  }) {
    return PhotographerState(
      photographerList: photographerList ?? this.photographerList,
      selectedPhotographer: selectedPhotographer ?? this.selectedPhotographer,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,photographerList,selectedPhotographer];
}


