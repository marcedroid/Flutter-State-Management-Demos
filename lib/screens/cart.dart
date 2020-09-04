import 'package:flutter/material.dart';
import 'package:state_management/blocs/catalog/catalog_bloc.dart';
import 'package:state_management/blocs/catalog/catalog_event.dart';
import 'package:state_management/blocs/user/user_bloc.dart';
import 'package:state_management/blocs/user/user_event.dart';
import 'package:state_management/models/item_model.dart';
import 'package:state_management/utils/format_total.dart';
import 'package:state_management/utils/get_initials.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  UserBloc _userBloc = UserBloc();
  CatalogBloc _catalogBloc = CatalogBloc();

  @override
  void initState() {
    super.initState();
    _userBloc.sendEvent.add(GetUsernameEvent());
    _catalogBloc.sendEvent.add(GetCatalogEvent());
  }

  @override
  void dispose() {
    _userBloc.dispose();
    _catalogBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ItemModel>>(
              initialData: [],
              stream: _catalogBloc.catalogStream,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      '${snapshot.data[index].name}'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '\$${snapshot.data[index].price.toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.amberAccent,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StreamBuilder<String>(
                  stream: _userBloc.userStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        CircleAvatar(
                          child: Text(
                            getInitials('${snapshot.data}').toUpperCase(),
                          ),
                        ),
                        Text(
                          '${snapshot.data}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Column(
                  children: [
                    SizedBox(height: 20.0),
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    StreamBuilder<List<ItemModel>>(
                      initialData: [],
                      stream: _catalogBloc.catalogStream,
                      builder: (context, snapshot) {
                        return Text(
                          '\$${formatTotal(snapshot.data)}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30.0)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
