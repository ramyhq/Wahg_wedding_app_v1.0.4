// ignore_for_file: must_be_immutable

part of 'cafe_and_restaurant_bloc.dart';

@immutable
abstract class CafeAndRestaurantEvent extends Equatable {}

class GetCafeAndRestaurantListEvent extends CafeAndRestaurantEvent {
  @override
  List<Object> get props => [];
}

class OpenCafeAndRestaurantDetailsEvent extends CafeAndRestaurantEvent {
  CafeAndRestaurant selectedCafeAndRestaurant;

  OpenCafeAndRestaurantDetailsEvent(
    this.selectedCafeAndRestaurant,
  );
  @override
  List<Object> get props => [selectedCafeAndRestaurant];
}
