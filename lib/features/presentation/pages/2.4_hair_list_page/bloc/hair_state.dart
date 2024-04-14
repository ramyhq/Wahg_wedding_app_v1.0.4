// ignore_for_file: must_be_immutable
part of 'hair_bloc.dart';

class HairState extends Equatable {
  List<Hair> hairList;
  Hair selectedHair;
  RequestState? requestState;

  HairState({
    this.selectedHair = const Hair(),
    this.hairList = const[],
    this.requestState = RequestState.initial,
  });

  HairState copyWith({
    List<Hair>? hairList,
    Hair? selectedHair,
    RequestState? requestState,
  }) {
    return HairState(
      hairList: hairList ?? this.hairList,
      selectedHair: selectedHair ?? this.selectedHair,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,hairList,selectedHair];
}


