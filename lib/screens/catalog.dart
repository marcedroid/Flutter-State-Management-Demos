import 'package:flutter/material.dart';
import 'package:state_management/blocs/catalog/catalog_bloc.dart';
import 'package:state_management/blocs/catalog/catalog_event.dart';
import 'package:state_management/models/item_model.dart';

import 'package:state_management/utils/hex_to_color.dart';
import 'package:state_management/items/items.dart' as sampleData;

class CatalogScreen extends StatefulWidget {
  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  CatalogBloc _catalogBloc = CatalogBloc();

  @override
  void initState() {
    super.initState();
    _catalogBloc.sendEvent.add(GetCatalogEvent());
  }

  @override
  void dispose() {
    _catalogBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
        ),
        title: Text('Products'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Stack(
              overflow: Overflow.visible,
              children: [
                Icon(Icons.shopping_basket),
                Positioned(
                  right: -10,
                  top: -10,
                  child: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    child: StreamBuilder<List<ItemModel>>(
                      initialData: [],
                      stream: _catalogBloc.catalogStream,
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data.length}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        );
                      },
                    ),
                    radius: 10.0,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
      body: Center(
        child: ListViewWidget(_catalogBloc),
      ),
    );
  }
}

class ListViewWidget extends StatefulWidget {
  final CatalogBloc _catalogBloc;

  const ListViewWidget(this._catalogBloc);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  List<ItemModel> items = [];

  @override
  void initState() {
    super.initState();

    sampleData.listItems.forEach(
      (element) => items.add(
        ItemModel(
          id: element['id'],
          name: element['name'],
          color: element['color'],
          pantoneValue: element['pantone_value'],
          price: element['price'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: hexToColor(items[index].color),
            ),
          ),
          title: Text('${items[index].name}'.toUpperCase()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${items[index].pantoneValue}'),
              Text(
                '\$${items[index].price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: items[index].addedToCart
                ? Icon(
                    Icons.remove_circle,
                    color: Colors.red,
                  )
                : Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
            onPressed: () {
              if (items[index].addedToCart) {
                widget._catalogBloc.sendEvent.add(
                  RemoveCatalogItemEvent(items[index]),
                );
              } else {
                widget._catalogBloc.sendEvent.add(
                  AddCatalogItemEvent(items[index]),
                );
              }

              setState(() {
                items[index].toggleAdded();
              });
            },
          ),
        ),
      ),
    );
  }
}
