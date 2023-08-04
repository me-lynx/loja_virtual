import 'package:equatable/equatable.dart';

import '../item.dart';
import '../models/catalog.dart';

abstract class CatalogState extends Equatable {
  const CatalogState();
  @override
  List<Object> get props => [];
}

//carregando o catalogo
class CatalogLoading extends CatalogState {}

//carregou o catalogo
class CatalogLoaded extends CatalogState {
  const CatalogLoaded(List<Item> catalog);
}

//erro relacionado ao catalogo
class CatalogError extends CatalogState {}

//item foi favoritado.
class CatalogItemFavorited extends CatalogState {}
