import 'package:flutter/material.dart';
import 'package:state_management/providers/catalog_provider.dart';
import 'package:state_management/providers/user_provider.dart';
import 'package:state_management/utils/get_initials.dart';
import 'package:provider/provider.dart';
import '../utils/format_total.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    final _catalogProvider = Provider.of<CatalogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _catalogProvider.catalog.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  '${_catalogProvider.catalog[index].name}'.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  '\$${_catalogProvider.catalog[index].price.toStringAsFixed(2)}',
                ),
              ),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: Text(
                          getInitials(_userProvider.username).toUpperCase()),
                    ),
                    Text(
                      '${_userProvider.username}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                    Text(
                      '\$${formatTotal(_catalogProvider.catalog)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
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
