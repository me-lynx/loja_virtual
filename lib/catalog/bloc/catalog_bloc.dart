import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loja_virtual/catalog/bloc/catalog_event.dart';
import 'package:loja_virtual/catalog/bloc/catalog_state.dart';
import 'package:loja_virtual/catalog/item.dart';

import '../../cart/bloc/cart_state.dart';
import '../../shopping_repository.dart';
import '../models/catalog.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc({required this.shoppingRepository}) : super(CatalogLoading()) {
    on<CatalogStarted>(_onStarted);
    on<ItemFavorited>(_onItemFavorited);
    // on<CatalogItemFavorited>(_onItemFavorited);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(
      CatalogStarted event, Emitter<CatalogState> emit) async {
    emit(CatalogLoading());
    try {
      final catalog = await shoppingRepository.loadCatalog();
      emit(CatalogLoaded(Catalog(itemNames: catalog)));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _onItemFavorited(
      ItemFavorited event, Emitter<CatalogState> emit) async {
    final state = this.state;
    try {
      event.item.isFavorite == true;
      shoppingRepository.addItemToFavorite(true);
      // emit(ItemFavorited(item: Cart(items: [...state.cart.items, event.item])));
      emit(CatalogItemFavorited());
      ItemFavorited(event.item);

      // emit(Item(event.item.id, event.item.id, price, true, event.item.image));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _getFavorites(
      ItemFavorited event, Emitter<CatalogState> emit) async {
    final state = this.state;

    final catalog = await shoppingRepository.loadCatalog();
  }
}
