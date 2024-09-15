import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/view/home/modal/home_modal.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeNavigateToWishEvent>(homeNavigateToWishEvent);
    on<HomeProductAddToWishEvent>(homeProductAddToWishEvent);
    on<HomeNavigateToCartEvent>(homeNavigateToCartEvent);
    on<HomeProductAddToCartEvent>(homeProductAddToCartEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: products
            .map(
              (e) => HomeModal(e),
            )
            .toList()));
  }

  FutureOr<void> homeNavigateToWishEvent(
      HomeNavigateToWishEvent event, Emitter<HomeState> emit) {
    log('Wish Page');
    emit(HomeNavigatorToWishState());
  }

  FutureOr<void> homeNavigateToCartEvent(
      HomeNavigateToCartEvent event, Emitter<HomeState> emit) {
    log('Cart Page');
    emit(HomeNavigatorToCartState());
  }

  FutureOr<void> homeProductAddToWishEvent(
      HomeProductAddToWishEvent event, Emitter<HomeState> emit) {
    log('Wish Product Add');
    wishProductList.add(event.clickedProduct);
    log('Wish List : ${wishProductList.length}');
  }

  FutureOr<void> homeProductAddToCartEvent(
      HomeProductAddToCartEvent event, Emitter<HomeState> emit) {
    log('Cart Product Add');
    cartProductList.add(event.clickedProduct);
    log('Cart List : ${cartProductList.length}');
  }
}
