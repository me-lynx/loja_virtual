import 'package:equatable/equatable.dart';

import '../item.dart';

class Catalog extends Equatable {
  const Catalog({required this.itemNames});

  final List<String> itemNames;

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);
  Item getByPosition(int position) => getById(position);

  @override
  List<Object?> get props => [itemNames];
}
