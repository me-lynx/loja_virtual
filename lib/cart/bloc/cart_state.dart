import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/cart/models/cart.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded({this.cart = const Cart()});
  final Cart cart;
  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}
