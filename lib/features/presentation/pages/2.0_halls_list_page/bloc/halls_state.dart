// ignore_for_file: must_be_immutable
part of 'halls_bloc.dart';

class HallsState extends Equatable {
  List<Hall> hallsList;
  Hall selectedHall;
  RequestState? requestState;

  HallsState({
    this.selectedHall = const Hall(),
    this.hallsList = const[],
    this.requestState = RequestState.initial,
  });

  HallsState copyWith({
    List<Hall>? hallsList,
    Hall? selectedHall,
    RequestState? requestState,
  }) {
    return HallsState(
      hallsList: hallsList ?? this.hallsList,
      selectedHall: selectedHall ?? this.selectedHall,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,hallsList,selectedHall];
}


