import 'package:flutter/material.dart';

class CustomFieldWidget extends StatelessWidget {
  const CustomFieldWidget({
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
    var text = label;
    if (isRequired) {
      text += ' *';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
