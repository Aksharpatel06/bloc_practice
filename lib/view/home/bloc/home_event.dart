part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNavigateToWishEvent extends HomeEvent {}

class HomeNavigateToCartEvent extends HomeEvent {}

class HomeProductAddToCartEvent extends HomeEvent {
  final HomeModal clickedProduct;

  HomeProductAddToCartEvent({required this.clickedProduct});
}

class HomeProductAddToWishEvent extends HomeEvent {
  final HomeModal clickedProduct;

  HomeProductAddToWishEvent({required this.clickedProduct});
}
