// ignore_for_file: must_be_immutable

part of 'suit_bloc.dart';

@immutable
abstract class SuitEvent extends Equatable {}

class GetSuitListEvent extends SuitEvent {
  @override
  List<Object> get props => [];
}

class OpenSuitDetailsEvent extends SuitEvent {
  Suit selectedSuit;

  OpenSuitDetailsEvent(
    this.selectedSuit,
  );
  @override
  List<Object> get props => [selectedSuit];
}
