import 'package:flutter/cupertino.dart';
import 'package:test_class/models/user_model.dart';

class UserState {
  final UserModel? user;

  UserState(this.user);

  factory UserState.initState() {
    return UserState(null);
  }
}

class UserStore extends ValueNotifier<UserState> {
  UserStore() : super(UserState.initState());

  bool get isLogged => value.user != null;

  void updateUser(UserModel model) {
    value = UserState(model);
  }

  void logout() {
    value = UserState.initState();
  }
}

final userStore = UserStore();
