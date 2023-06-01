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

  // Item getByPosition(int position) => getById(position);

  @override
  List<Object?> get props => [itemNames];
}
