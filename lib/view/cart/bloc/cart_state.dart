part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<HomeModal> cartList;

  CartSuccessState({required this.cartList});
}
