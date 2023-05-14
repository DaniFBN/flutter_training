import 'package:flutter/material.dart';
import 'package:test_class/pages/home_page.dart';
import 'package:test_class/stores/user_store.dart';

import '../models/user_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userStore.updateUser(const UserModel('Daniel'));

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomePage(userStoreScope: userStore)),
          );
        },
        child: const Icon(Icons.login),
      ),
    );
  }
}
