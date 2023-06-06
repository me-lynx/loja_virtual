import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_bloc.dart';
import 'package:loja_virtual/catalog/bloc/catalog_state.dart';
import 'package:loja_virtual/catalog/view/catalog_page.dart';

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
                var item = state.catalog.getAllFavorites();
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CatalogListItem(item: item[index]);
                  }, childCount: item.length),
                );
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
