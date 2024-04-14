// ignore_for_file: must_be_immutable

part of 'photographer_bloc.dart';

@immutable
abstract class PhotographerEvent extends Equatable {}

class GetPhotographerListEvent extends PhotographerEvent {
  @override
  List<Object> get props => [];
}

class OpenPhotographerDetailsEvent extends PhotographerEvent {
  Photographer selectedPhotographer;

  OpenPhotographerDetailsEvent(
    this.selectedPhotographer,
  );
  @override
  List<Object> get props => [selectedPhotographer];
}
