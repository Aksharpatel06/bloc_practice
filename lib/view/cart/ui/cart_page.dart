import 'package:bloc_practice/view/cart/bloc/cart_bloc.dart';
import 'package:bloc_practice/view/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          // if(state is Cart)
          //   {
          //
          //   }
        },
        builder: (context, state) {
          if (state is CartSuccessState) {
            return ListView.builder(
              itemCount: state.cartList.length,
              itemBuilder: (context, index) => CartProductCard(
                homeModal: state.cartList[index],
                cartBloc: cartBloc,
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
