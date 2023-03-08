import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCardWidget extends StatelessWidget {
  const GameCardWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFf0f3f8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
