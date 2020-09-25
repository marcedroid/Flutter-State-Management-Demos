import 'package:flutter/material.dart';
import 'package:state_management/models/item_model.dart';

class CatalogProvider with ChangeNotifier {
  List<ItemModel> _catalog = [];

  List<ItemModel> get catalog => _catalog;

  void addToCatalog(ItemModel itemModel) {
    _catalog.add(itemModel);
    notifyListeners();
  }

  void removeFromCatalog(ItemModel itemModel) {
    _catalog.remove(itemModel);
    notifyListeners();
  }
}
