// ignore_for_file: must_be_immutable

part of 'hair_bloc.dart';

@immutable
abstract class HairEvent extends Equatable {}

class GetHairListEvent extends HairEvent {
  @override
  List<Object> get props => [];
}

class OpenHairDetailsEvent extends HairEvent {
  Hair selectedHair;

  OpenHairDetailsEvent(
    this.selectedHair,
  );
  @override
  List<Object> get props => [selectedHair];
}
