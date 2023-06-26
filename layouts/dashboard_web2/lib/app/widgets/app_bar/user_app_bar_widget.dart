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
    final appBarTheme = Theme.of(context).appBarTheme;
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
            userName.toUpperCase(),
            maxLines: 3,
            style: appBarTheme.titleTextStyle,
          ),
        ),
        const SizedBox(width: 28),
        TextButton.icon(
          onPressed: onLogoutTap,
          icon: Icon(
            Icons.logout,
            color: appBarTheme.iconTheme!.color,
          ),
          label: Text(
            'Sair',
            style: appBarTheme.titleTextStyle!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
