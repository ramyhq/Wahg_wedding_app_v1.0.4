// ignore_for_file: must_be_immutable

part of 'makeup_artist_bloc.dart';

@immutable
abstract class MakeupArtistEvent extends Equatable {}

class GetMakeupArtistListEvent extends MakeupArtistEvent {
  @override
  List<Object> get props => [];
}

class OpenMakeupArtistDetailsEvent extends MakeupArtistEvent {
  MakeupArtist selectedMakeupArtist;

  OpenMakeupArtistDetailsEvent(
    this.selectedMakeupArtist,
  );
  @override
  List<Object> get props => [selectedMakeupArtist];
}
