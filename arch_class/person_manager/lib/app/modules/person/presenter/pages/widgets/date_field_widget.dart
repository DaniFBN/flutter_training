import 'package:flutter/material.dart';

import 'custom_field_widget.dart';
import 'custom_text_field_widget.dart';

class DateFieldWidget extends StatefulWidget {
  const DateFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<DateFieldWidget> createState() => _DateFieldWidgetState();
}

class _DateFieldWidgetState extends State<DateFieldWidget> {
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
    return CustomFieldWidget(
      label: 'Data',
      isRequired: true,
      field: CustomTextFieldWidget(
        hintText: 'Selecione a data',
        controller: widget.controller,
        isRequired: true,
        readOnly: true,
        onTap: selectDate,
      ),
    );
  }
}
