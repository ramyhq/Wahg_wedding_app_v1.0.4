// ignore_for_file: must_be_immutable
part of 'travel_bloc.dart';

class TravelState extends Equatable {
  List<Travel> travelList;
  Travel selectedTravel;
  RequestState? requestState;

  TravelState({
    this.selectedTravel = const Travel(),
    this.travelList = const[],
    this.requestState = RequestState.initial,
  });

  TravelState copyWith({
    List<Travel>? travelList,
    Travel? selectedTravel,
    RequestState? requestState,
  }) {
    return TravelState(
      travelList: travelList ?? this.travelList,
      selectedTravel: selectedTravel ?? this.selectedTravel,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,travelList,selectedTravel];
}


