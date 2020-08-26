import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController =
        TextEditingController(text: 'Guest');

    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
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
          onChanged: (value) {},
        ),
      ),
    );
  }
}
