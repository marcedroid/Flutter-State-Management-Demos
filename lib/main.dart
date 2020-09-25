import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/catalog_provider.dart';
import 'package:state_management/providers/user_provider.dart';
import 'package:state_management/screens/cart.dart';
import 'package:state_management/screens/catalog.dart';
import 'package:state_management/screens/user.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CatalogProvider())
        ],
        child: MyApp(),
      ),
    );

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
