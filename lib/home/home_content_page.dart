import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_state.dart';
import 'package:loja_virtual/catalog/view/catalog_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../catalog/item.dart';import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_event.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../cart/bloc/cart_event.dart';
import '../../cart/bloc/cart_state.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeContentPage extends StatefulWidget {
  const HomeContentPage({super.key});

  @override
  State<HomeContentPage> createState() => _HomeContentPageState();
}

class _HomeContentPageState extends State<HomeContentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                // var item = state.catalog.getAllFavorites();
                // return SliverToBoxAdapter(
                //   child: SizedBox(
                //     height: 100.0,
                //     width: 100,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: item.length,
                //       itemBuilder: (context, index) {
                //         return FavoritedItems(item: item[index]);
                //       },
                //     ),
                //   ),
                // );

                // return SliverList(
                //   delegate: SliverChildBuilderDelegate((context, index) {
                //     return FavoritedItems(item: item[index]);
                //   }, childCount: item.length),
                // );
              }
              return const SliverFillRemaining(
                child: Text('Não foi possivel carregar os itens favoritos'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class FavoritedItems extends StatelessWidget {
  const FavoritedItems({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 2,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
            height: 100,
            width: 200,
            child: Image.asset(item.image),
          )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
