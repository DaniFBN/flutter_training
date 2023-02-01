// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String userName;
  final VoidCallback toggleShowInformation;
  final String? userImage;
  final bool showInformation;

  const HomeHeaderWidget({
    Key? key,
    required this.userName,
    required this.toggleShowInformation,
    this.userImage,
    this.showInformation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        top: mediaQuery.viewPadding.top + 22,
        left: 16,
        right: 16,
        bottom: 22,
      ),
      color: theme.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: theme.primaryColorLight,
                  shape: BoxShape.circle,
                ),
                child: userImage != null
                    ? Image.network(userImage!)
                    : Icon(
                        Icons.add_a_photo_outlined,
                        color: theme.appBarTheme.iconTheme?.color,
                      ),
              ),
              const Spacer(),
              _IconButton(
                onPressed: toggleShowInformation,
                icon: showInformation
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              _IconButton(
                onPressed: () {},
                icon: Icons.help_outline_rounded,
              ),
              _IconButton(
                onPressed: () {},
                icon: Icons.person_add_alt_1_outlined,
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Olá, $userName',
            style: theme.appBarTheme.titleTextStyle,
          )
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const _IconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: theme.appBarTheme.iconTheme?.size,
        color: theme.appBarTheme.iconTheme?.color,
      ),
    );
  }
}
