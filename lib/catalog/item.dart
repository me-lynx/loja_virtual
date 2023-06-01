import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Item extends Equatable {
  Item(this.id, this.name, this.price, this.isFavorite, this.image)
      : color = Colors.primaries[id % Colors.primaries.length];

  final int id;
  final String name;
  final Color color;
  double price = 0;
  bool isFavorite = false;
  String image;

  @override
  List<Object> get props => [id, name, color, price, isFavorite];
}
