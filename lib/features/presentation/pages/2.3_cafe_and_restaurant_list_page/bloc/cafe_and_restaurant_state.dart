// ignore_for_file: must_be_immutable
part of 'cafe_and_restaurant_bloc.dart';

class CafeAndRestaurantState extends Equatable {
  List<CafeAndRestaurant> cafeAndRestaurantList;
  CafeAndRestaurant selectedCafeAndRestaurant;
  RequestState? requestState;

  CafeAndRestaurantState({
    this.selectedCafeAndRestaurant = const CafeAndRestaurant(),
    this.cafeAndRestaurantList = const[],
    this.requestState = RequestState.initial,
  });

  CafeAndRestaurantState copyWith({
    List<CafeAndRestaurant>? cafeAndRestaurantList,
    CafeAndRestaurant? selectedCafeAndRestaurant,
    RequestState? requestState,
  }) {
    return CafeAndRestaurantState(
      cafeAndRestaurantList: cafeAndRestaurantList ?? this.cafeAndRestaurantList,
      selectedCafeAndRestaurant: selectedCafeAndRestaurant ?? this.selectedCafeAndRestaurant,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [requestState,cafeAndRestaurantList,selectedCafeAndRestaurant];
}


