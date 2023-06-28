import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.label,
    required this.field,
  }) : super(key: key);

  final String label;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
