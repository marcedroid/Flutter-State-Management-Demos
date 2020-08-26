import 'package:flutter/material.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'package:state_management/screens/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogScreen(),
        '/user': (context) => UserScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
