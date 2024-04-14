// ignore_for_file: must_be_immutable
part of 'dresses_bloc.dart';

class DressesState extends Equatable {
  List<Dress> dressesList;
  Dress selectedDress;
  RequestState? requestState;

  DressesState({
    this.selectedDress = const Dress(),
    this.dressesList = const[],
    this.requestState = RequestState.initial,
  });

  DressesState copyWith({
    List<Dress>? dressesList,
    Dress? selectedDress,
    RequestState? requestState,
  }) {
    return DressesState(
      dressesList: dressesList ?? this.dressesList,
      selectedDress: selectedDress ?? this.selectedDress,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,dressesList,selectedDress];
}


