import 'package:bloc_practice/view/home/modal/home_modal.dart';
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';

class ProductCard extends StatelessWidget {
  final HomeModal homeModal;
  final HomeBloc homeBloc;

  const ProductCard({super.key, required this.homeModal,required this.homeBloc});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(homeModal.id.toString()),
      subtitle: Text(homeModal.name),
      leading:
          IconButton(onPressed: () {
            homeBloc.add(HomeProductAddToWishEvent(clickedProduct: homeModal));
          }, icon: const Icon(Icons.favorite_border)),
      trailing: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            homeBloc.add(HomeProductAddToCartEvent(clickedProduct: homeModal));
          },
          icon: const Icon(Icons.shopping_cart_outlined)),
    );
  }
}
