// ignore_for_file: must_be_immutable

part of 'travel_bloc.dart';

@immutable
abstract class TravelEvent extends Equatable {}

class GetTravelListEvent extends TravelEvent {
  @override
  List<Object> get props => [];
}

class OpenTravelDetailsEvent extends TravelEvent {
  Travel selectedTravel;

  OpenTravelDetailsEvent(
    this.selectedTravel,
  );
  @override
  List<Object> get props => [selectedTravel];
}
