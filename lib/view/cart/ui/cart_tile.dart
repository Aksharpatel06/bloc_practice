import 'package:bloc_practice/view/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/view/home/modal/home_modal.dart';
import 'package:flutter/material.dart';


class CartProductCard extends StatelessWidget {
  final HomeModal homeModal;
  final CartBloc cartBloc;

  const CartProductCard(
      {super.key, required this.cartBloc, required this.homeModal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(homeModal.id.toString()),
      subtitle: Text(homeModal.name),
      // leading: IconButton(
      //     onPressed: () {
      //       // homeBloc.add(HomeProductAddToWishEvent(clickedProduct: homeModal));
      //     },
      //     icon: const Icon(Icons.favorite_border)),
      trailing: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // homeBloc.add(HomeProductAddToCartEvent(clickedProduct: homeModal));
            cartBloc.add(CartRemoveFromCartEvent(cartProduct: homeModal));
          },
          icon: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
