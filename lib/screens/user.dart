import 'package:flutter/material.dart';
import 'package:state_management/blocs/user/user_bloc.dart';
import 'package:state_management/blocs/user/user_event.dart';
import 'package:state_management/blocs/user/user_state.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _textEditingController;
  UserBloc _userBloc = UserBloc();

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController(text: UserState().username);
    _userBloc.sendEvent.add(GetUsernameEvent());
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<String>(
          stream: _userBloc.userStream,
          builder: (context, snapshot) {
            return Text('User - ${snapshot.data}');
          },
        ),
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
            _userBloc.sendEvent.add(OnChangeEvent(value));
          },
        ),
      ),
    );
  }
}
