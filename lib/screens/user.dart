import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/user_provider.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController =
        TextEditingController(text: context.read<UserProvider>().username);
  }

  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User - ${_userProvider.username}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          autofocus: false,
          controller: _textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            helperText: 'Guest by default',
            labelText: 'User Name',
          ),
          onChanged: (value) {
            _userProvider.onChange(value);
          },
        ),
      ),
    );
  }
}
