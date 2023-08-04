import 'package:equatable/equatable.dart';

import '../../catalog/item.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Item>[]});
  final List<Item> items;

  @override
  List<Object?> get props => [items];
}
