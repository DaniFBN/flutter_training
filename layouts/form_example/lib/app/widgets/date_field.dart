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
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 30)),
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
        focusNode: FocusNode(),
        hintText: 'Selecione a data',
        controller: widget.controller,
        required: true,
        // readOnly: true,
        // onTap: selectDate,
        suffix: IconButton(
          icon: const Icon(Icons.calendar_month_outlined),
          onPressed: selectDate,
        ),
      ),
    );
  }
}
