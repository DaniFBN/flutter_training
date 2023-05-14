import 'package:flutter/material.dart';
import 'package:test_class/pages/login_page.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userStore.logout();

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        },
        child: const Icon(Icons.logout),
      ),
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
