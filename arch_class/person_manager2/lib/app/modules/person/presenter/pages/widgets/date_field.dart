import 'package:flutter/material.dart';

import 'custom_field.dart';
import 'custom_text_field.dart';

class DateField extends StatefulWidget {
  const DateField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  Future<void> selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 44000)),
      lastDate: DateTime.now(),
    );

    if (date == null) return;

    widget.controller.text = date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      label: 'Data',
      isRequired: true,
      field: CustomTextField(
        hintText: 'Selecione a data',
        controller: widget.controller,
        required: true,
        readOnly: true,
        onTap: selectDate,
      ),
    );
  }
}
