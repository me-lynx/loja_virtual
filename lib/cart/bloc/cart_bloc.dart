import 'package:bloc/bloc.dart';

import '../../shopping_repository.dart';
import '../models/cart.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this.shoppingRepository) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  final ShoppingRepository shoppingRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final items = await shoppingRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(items: [...items])));
    } catch (e) {
      emit(CartError());
    }
  }

  Future<void> _onItemAdded(
      CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        shoppingRepository.addItemToCart(event.item);
        emit(CartLoaded(cart: Cart(items: [...state.cart.items, event.item])));
      } catch (e) {
        emit(CartError());
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeItemFromCart(event.item);
        emit(CartLoaded(
            cart: Cart(items: [...state.cart.items]..remove(event.item))));
      } catch (e) {
        emit(CartError());
      }
    }
  }
}
