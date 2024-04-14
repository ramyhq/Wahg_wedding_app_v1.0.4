// ignore_for_file: must_be_immutable
part of 'suit_bloc.dart';

class SuitState extends Equatable {
  List<Suit> suitsList;
  Suit selectedSuit;
  RequestState? requestState;

  SuitState({
    this.selectedSuit = const Suit(),
    this.suitsList = const[],
    this.requestState = RequestState.initial,
  });

  SuitState copyWith({
    List<Suit>? suitsList,
    Suit? selectedSuit,
    RequestState? requestState,
  }) {
    return SuitState(
      suitsList: suitsList ?? this.suitsList,
      selectedSuit: selectedSuit ?? this.selectedSuit,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,suitsList,selectedSuit];
}


