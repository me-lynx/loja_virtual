import 'package:equatable/equatable.dart';

import '../item.dart';

class Catalog extends Equatable {
  const Catalog({required this.itemNames});

  final List<Item> itemNames;

  Item getById(int id) {
    int index = itemNames.indexWhere((item) => item.id == id);
    return itemNames[index];
  }

  List<Item> getAll() {
    return itemNames;
  }
  //
  // List<Item> getAllFavorites() {
  //   var results = itemNames.where((element) {
  //     if (element.isFavorite == true) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }).toList();
  //   return results;
  // }

  @override
  List<Object?> get props => [itemNames];
}
