class UserState {
  String _username = 'Guest';

  UserState._();
  static UserState _instance = UserState._();
  factory UserState() => _instance;

  String get username => _username;

  void onChange(value) {
    _username = value;
  }
}
