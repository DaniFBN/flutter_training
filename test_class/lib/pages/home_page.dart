import 'package:flutter/material.dart';
import 'package:test_class/stores/user_store.dart';

class HomePage extends StatelessWidget {
  final UserStore userStoreScope;

  const HomePage({
    Key? key,
    required this.userStoreScope,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: userStoreScope,
        builder: (_, state, __) {
          final key = userStoreScope.isLogged
              ? 'user-logged-key'
              : 'user-not-logged-key';

          return Center(
            child: Text(
              userStoreScope.value.user?.name ?? '',
              key: Key(key),
            ),
          );
        },
      ),
    );
  }
}
