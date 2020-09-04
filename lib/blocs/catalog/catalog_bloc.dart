import 'dart:async';

import 'package:state_management/blocs/catalog/catalog_event.dart';
import 'package:state_management/blocs/catalog/catalog_state.dart';
import 'package:state_management/models/item_model.dart';

class CatalogBloc {
  CatalogState _catalogState = CatalogState();

  StreamController<CatalogEvent> _input = StreamController();
  StreamController<List<ItemModel>> _output =
      StreamController<List<ItemModel>>.broadcast();

  StreamSink<CatalogEvent> get sendEvent => _input.sink;
  Stream<List<ItemModel>> get catalogStream => _output.stream;

  CatalogBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(CatalogEvent event) {
    if (event is AddCatalogItemEvent) {
      _catalogState.addToCatalog(event.item);
    } else if (event is RemoveCatalogItemEvent) {
      _catalogState.removeFromCatalog(event.item);
    }

    _output.add(_catalogState.catalog);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
