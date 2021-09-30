import 'package:flutter_catalog/model/catalog.dart';

class CartModel {
  //catalog field
  CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newcatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total * current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }
}
