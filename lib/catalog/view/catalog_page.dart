import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_event.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../cart/bloc/cart_event.dart';
import '../bloc/catalog_bloc.dart';
import '../bloc/catalog_state.dart';
import '../item.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

//https://www.fiverr.com/mdtoufikislam/create-attractive-mobile-ui-ux-design-or-app-ui-ux-design
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogLoading) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state is CatalogLoaded) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => CatalogListItem(
                      item: state.catalog.getByPosition(index),
                    ),
                    childCount: state.catalog.itemNames.length,
                  ),
                );
              }
              return const SliverFillRemaining(
                child: Text('Ocorreu um erro'),
              );
            },
          ),
        ],
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
        color: Colors.white,
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
                    child: isFavorite
                        // ignore: dead_code
                        ? const FaIcon(FontAwesomeIcons.heart)
                        : FaIcon(FontAwesomeIcons.heart),
                    onTap: () {
                      context.read<CatalogBloc>().add(ItemFavorited(item));
                      //Criar um bloc para favorito.
                    },
                  ),
                  GestureDetector(
                      child: const FaIcon(FontAwesomeIcons.plus), onTap: () {}),
                ],
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset('images/image5shoes.jpeg'),
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
