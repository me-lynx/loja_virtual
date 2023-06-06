import 'package:flutter/material.dart';
import 'package:loja_virtual/cart/bloc/cart_event.dart';
import 'package:loja_virtual/cart/models/cart.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        color: Colors.white,
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
                                    child: Image.asset(item.image),
                                  ),
                                  Text(item.name),
                                  Text(
                                    ' R\$ ${item.price.toString()}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child:
                                          const FaIcon(FontAwesomeIcons.minus)),
                                  SizedBox(
                                    height: 60,
                                    width: 30,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          fillColor: Colors.pink),
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child:
                                          const FaIcon(FontAwesomeIcons.plus)),
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
                ' Total: R\$ ${state.cart.totalPrice}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {},
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
