import 'package:state_management/models/item_model.dart';

abstract class CatalogEvent {}

class AddCatalogItemEvent extends CatalogEvent {
  final ItemModel item;

  AddCatalogItemEvent(this.item);
}

class RemoveCatalogItemEvent extends CatalogEvent {
  final ItemModel item;

  RemoveCatalogItemEvent(this.item);
}

class GetCatalogEvent extends CatalogEvent {}
