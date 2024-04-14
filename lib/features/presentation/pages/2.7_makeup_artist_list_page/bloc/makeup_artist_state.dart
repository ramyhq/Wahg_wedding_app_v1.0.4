// ignore_for_file: must_be_immutable
part of 'makeup_artist_bloc.dart';

class MakeupArtistState extends Equatable {
  List<MakeupArtist> makeupArtistList;
  MakeupArtist selectedMakeupArtist;
  RequestState? requestState;

  MakeupArtistState({
    this.selectedMakeupArtist = const MakeupArtist(),
    this.makeupArtistList = const[],
    this.requestState = RequestState.initial,
  });

  MakeupArtistState copyWith({
    List<MakeupArtist>? makeupArtistList,
    MakeupArtist? selectedMakeupArtist,
    RequestState? requestState,
  }) {
    return MakeupArtistState(
      makeupArtistList: makeupArtistList ?? this.makeupArtistList,
      selectedMakeupArtist: selectedMakeupArtist ?? this.selectedMakeupArtist,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,makeupArtistList,selectedMakeupArtist];
}


