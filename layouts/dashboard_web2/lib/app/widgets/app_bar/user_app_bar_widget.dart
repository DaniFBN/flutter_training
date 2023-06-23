import 'package:flutter/material.dart';

class UserAppBarWidget extends StatelessWidget {
  const UserAppBarWidget({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.onLogoutTap,
  }) : super(key: key);

  final String userName;
  final String userImage;
  final VoidCallback onLogoutTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Image.network(
            userImage,
            fit: BoxFit.fill,
            width: 64,
            height: 64,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            userName,
            maxLines: 3,
          ),
        ),
        const SizedBox(width: 28),
        TextButton.icon(
          onPressed: onLogoutTap,
          icon: const Icon(Icons.logout),
          label: const Text('Sair'),
        ),
      ],
    );
  }
}
