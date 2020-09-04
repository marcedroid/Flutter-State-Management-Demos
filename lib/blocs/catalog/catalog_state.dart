import 'package:state_management/models/item_model.dart';

class CatalogState {
  List<ItemModel> _catalog = [];

  CatalogState._();
  static CatalogState _instance = CatalogState._();
  factory CatalogState() => _instance;

  List<ItemModel> get catalog => _catalog;

  void addToCatalog(ItemModel itemModel) {
    _catalog.add(itemModel);
  }

  void removeFromCatalog(ItemModel itemModel) {
    _catalog.remove(itemModel);
  }
}
