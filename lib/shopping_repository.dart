import 'catalog/item.dart';

const _delay = Duration(milliseconds: 800);

final _catalog = [
  Item(1, 'Tênis de Academia', 200.0, false, 'images/image4shoes.jpg'),
  Item(2, 'Bota Vermelha', 140.0, false, 'images/image5shoes.jpeg'),
  Item(3, 'Sapato boneca', 230.0, true, 'images/image6shoes.jpeg'),
  Item(4, 'Sapato ', 100.0, true, 'images/image7shoes.jpeg'),
];

class ShoppingRepository {
  final _items = <Item>[];

  Future<List<Item>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Item item) => _items.add(item);

  void removeItemFromCart(Item item) => _items.remove(item);

  void addItemToFavorite(Item item) => _items.add(item);
}
