import 'package:flutter/material.dart';

import 'custom_field.dart';
import 'custom_text_field.dart';

class TimeField extends StatefulWidget {
  const TimeField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  Future<void> selectDate() async {
    final date = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (date == null) return;

    widget.controller.text = date.toString();
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      label: 'Hora',
      field: CustomTextField(
        focusNode: FocusNode(),
        hintText: 'Selecione a hora',
        controller: widget.controller,
        required: true,
        // readOnly: true,
        // onTap: selectDate,
        suffix: IconButton(
          icon: const Icon(Icons.timer_outlined),
          onPressed: selectDate,
        ),
      ),
    );
  }
}
