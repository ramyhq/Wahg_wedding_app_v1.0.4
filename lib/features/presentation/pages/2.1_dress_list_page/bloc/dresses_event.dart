// ignore_for_file: must_be_immutable

part of 'dresses_bloc.dart';

@immutable
abstract class DressesEvent extends Equatable {}

class GetDressesListEvent extends DressesEvent {
  @override
  List<Object> get props => [];
}

class OpenDressDetailsEvent extends DressesEvent {
  Dress selectedDress;

  OpenDressDetailsEvent(
    this.selectedDress,
  );
  @override
  List<Object> get props => [selectedDress];
}
