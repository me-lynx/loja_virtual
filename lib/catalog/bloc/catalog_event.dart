import 'package:equatable/equatable.dart';

import '../item.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class CatalogStarted extends CatalogEvent {
  @override
  List<Object> get props => [];
}

class ItemFavorited extends CatalogEvent {
  const ItemFavorited(this.item);
  final Item item;
  @override
  List<Object> get props => [item];
}
