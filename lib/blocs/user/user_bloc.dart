import 'dart:async';

import 'package:state_management/blocs/user/user_event.dart';
import 'package:state_management/blocs/user/user_state.dart';

class UserBloc {
  UserState _userState = UserState();

  StreamController<UserEvent> _input = StreamController();
  StreamController<String> _output = StreamController();

  StreamSink<UserEvent> get sendEvent => _input.sink;
  Stream<String> get userStream => _output.stream;

  UserBloc() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(UserEvent event) {
    if (event is OnChangeEvent) {
      _userState.onChange(event.value);
    }

    _output.add(_userState.username);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
