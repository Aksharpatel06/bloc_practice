import 'package:bloc_practice/view/cart/ui/cart_page.dart';
import 'package:bloc_practice/view/home/bloc/home_bloc.dart';
import 'package:bloc_practice/view/home/ui/product_card.dart';
import 'package:bloc_practice/view/wish/ui/wish_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigatorToCartState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
          } else if (state is HomeNavigatorToWishState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WishPage(),
                ));
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is HomeLoadedSuccessState) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToWishEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeNavigateToCartEvent());
                      },
                      icon: const Icon(Icons.shopping_cart_outlined))
                ],
                title: const Text('MyApp'),
              ),
              body: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) => ProductCard(
                  homeModal: state.products[index],
                  homeBloc: homeBloc,
                ),
              ),
            );
          } else if (state is HomeErrorState) {
            return const Scaffold(
              body: Center(
                child: Text('Error'),
              ),
            );
          } else {
            return const Placeholder();
          }
        });
  }
}
