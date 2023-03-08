// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeCardWidget extends StatelessWidget {
  const TimeCardWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Widget description;

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
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            description
          ],
        ),
      ),
    );
  }
}
