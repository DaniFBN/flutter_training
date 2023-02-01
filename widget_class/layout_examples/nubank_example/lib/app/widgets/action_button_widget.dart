// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String? specialText;
  final bool showInformation;

  const ActionButtonWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.specialText,
    this.showInformation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 76,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                color: theme.cardColor,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  Center(child: Icon(icon)),
                  if (specialText != null)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: FittedBox(
                          child: Text(
                            showInformation ? specialText! : '●●●●',
                            style: theme.primaryTextTheme.labelMedium,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
