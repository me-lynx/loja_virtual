import 'catalog/item.dart';

const _delay = Duration(milliseconds: 800);

final _catalog = [
  Item(1, 'Tênis de Academia', 200.0, false, 'images/image4shoes.jpg'),
  Item(2, 'Bota Vermelha', 140.0, true, 'images/image5shoes.jpeg'),
  Item(3, 'Sapato boneca', 230.0, true, 'images/image6shoes.jpeg'),
  Item(4, 'Sapato ', 100.0, true, 'images/image7shoes.jpeg'),
  Item(5, 'Tênis de Academia Masculino ', 300.0, true,
      'images/image9shoes.jpeg'),
  Item(6, 'All Star Azul ', 200.0, true, 'images/image10shoes.png'),
  Item(7, 'Sapato Dourado ', 200.0, true, 'images/image11shoes.jpg'),
  Item(8, 'Sapato Feminino Preto Spikes ', 150.0, true,
      'images/image12shoes.jpeg'),
  Item(9, 'Sapato Vermelho Feminino', 90.0, true, 'images/image14shoes.jpeg'),
  Item(10, 'Chuteira Verde ', 100.0, true, 'images/image13shoes.png'),
];

class ShoppingRepository {
  final _items = <Item>[];

  Future<List<Item>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<Item>> loadCartItems() => Future.delayed(_delay, () => _items);

  void addItemToCart(Item item) => _items.add(item);

  void removeItemFromCart(Item item) => _items.remove(item);

  void addItemToFavorite(bool value) => _items.forEach((element) {
        element.isFavorite == true;
      });
}
