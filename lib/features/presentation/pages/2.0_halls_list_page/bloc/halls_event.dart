// ignore_for_file: must_be_immutable

part of 'halls_bloc.dart';

@immutable
abstract class HallsEvent extends Equatable {}

class GetHallsListEvent extends HallsEvent {
  @override
  List<Object> get props => [];
}

class OpenHallDetailsEvent extends HallsEvent {
  Hall selectedHall;

  OpenHallDetailsEvent(
    this.selectedHall,
  );
  @override
  List<Object> get props => [selectedHall];
}
