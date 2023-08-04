import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_event.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../../cart/bloc/cart_event.dart';
import '../../cart/bloc/cart_state.dart';
import '../bloc/catalog_bloc.dart';
import '../bloc/catalog_state.dart';
import '../item.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../item.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

//https://www.fiverr.com/mdtoufikislam/create-attractive-mobile-ui-ux-design-or-app-ui-ux-design
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

//Enviar o carrinho para o firebase
//Editar o total do carrinho
//Editar o total do pedido
//Enviar o pedido para o firebase

class _CatalogPageState extends State<CatalogPage> {
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  fetchItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('catalogo').get();
    var ret = snapshot.docs.map((e) => _getItemsFromSnaphot(e)).toList();

    setState(() {
      items = ret;
    });
    print(ret);
  }

  Item _getItemsFromSnaphot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw 'DocumentSnapshot vazio';
    }
    String nome = data['nome'] ?? '';
    String id = data['id'] ?? '';
    String imagem = data['imagem'] ?? '';
    bool isfavorite = data['isfavorite'] ?? false;
    String preco = data['preco'] ?? '';
    String color = data['color'] ?? '';
    return Item(
        id: id,
        name: nome,
        price: preco,
        isFavorite: isfavorite,
        image: imagem,
        color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: Image.network(items[index].image),
                      width: 60,
                      height: 60,
                    ),
                    Text(items[index].name),
                    Text(items[index].price.toString()),
                    AddIconButton(item:items[index]),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class CatalogListItem extends StatelessWidget {
  const CatalogListItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    bool isFavorite = false;
    return SizedBox(
      child: Card(
        surfaceTintColor: Colors.white,
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: item.isFavorite
                        // ignore: dead_code
                        ? const FaIcon(FontAwesomeIcons.heartCircleCheck)
                        : const FaIcon(FontAwesomeIcons.heart),
                    onTap: () {
                      context.read<CatalogBloc>().add(ItemFavorited(item));
                      //Criar um bloc para favorito.
                    },
                  ),
                  AddIconButton(
                    item: item,
                  ),
                ],
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(item.image),
              ),
              Text(item.price.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(item.name)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddIconButton extends StatelessWidget {
  const AddIconButton({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          final isInCart = state.cart.items.contains(item);
          return TextButton(
              onPressed: isInCart
                  ? null
                  : () => context.read<CartBloc>().add(CartItemAdded(item)),
              child: isInCart
                  ? const FaIcon(FontAwesomeIcons.check)
                  : const FaIcon(FontAwesomeIcons.plus));
        }
        return const Text('Algo deu errado!');
      },
    );
  }
}
