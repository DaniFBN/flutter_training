import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    required this.label,
    required this.field,
    this.isRequired = false,
  }) : super(key: key);

  final String label;
  final bool isRequired;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isRequired) ...{
          Text('$label *'),
        } else ...{
          Text(label),
        },
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
