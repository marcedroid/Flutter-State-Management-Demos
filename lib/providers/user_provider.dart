import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = 'Guest';

  String get username => _username;

  void onChange(value) {
    _username = value;
    notifyListeners();
  }
}
