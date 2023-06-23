import 'package:flutter/material.dart';

class UserAppBarSectionWidget extends StatelessWidget {
  const UserAppBarSectionWidget({
    super.key,
    required this.userName,
    required this.userImage,
  });

  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          child: Image.network(
            userImage,
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName.toUpperCase(),
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            const Text('MINHAS INFORMAÇÕES'),
          ],
        ),
        const SizedBox(width: 40),
        const Icon(Icons.logout_rounded)
      ],
    );
  }
}
