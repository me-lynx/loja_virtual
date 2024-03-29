import 'package:flutter/material.dart';
import 'package:loja_virtual/cart/bloc/cart_event.dart';
import 'package:loja_virtual/cart/models/cart.dart';
import 'package:loja_virtual/order/order_details_page.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../routes_helper/routes.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';

//TODO: Incluir na proxima mentoria as cores dos produtos.
/// E NO CATALOGO TAMBEM
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carrinho',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Column(
        children: [Expanded(child: CartList())],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is CartLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final item = state.cart.items[index];
                      return Card(
                        surfaceTintColor: Colors.white,
                        borderOnForeground: true,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () => context
                                        .read<CartBloc>()
                                        .add(CartItemRemoved(item)),
                                    child: const FaIcon(
                                      FontAwesomeIcons.x,
                                      size: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(item.image),
                                  ),
                                  Text(item.name),
                                  Text(
                                    ' R\$ ${item.price.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Spacer(),
                    itemCount: state.cart.items.length),
              ),
              Text(
                ' Total: R',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: false)
                      .push(MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(
                                cart: state.cart,
                              ),
                          maintainState: false));
                },
                child: const Text('Avançar'),
              ),
            ],
          );
        }

        return Container();
      },
    );
  }
}
