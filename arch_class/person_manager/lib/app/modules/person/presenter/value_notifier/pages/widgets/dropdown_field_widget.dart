import 'package:flutter/material.dart';

import 'custom_field_widget.dart';

class DropdownFieldWidget extends StatefulWidget {
  const DropdownFieldWidget({
    Key? key,
    required this.value,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  final String value;
  final List<String> values;
  final void Function(String value) onChanged;

  @override
  State<DropdownFieldWidget> createState() => _DropdownFieldWidgetState();
}

class _DropdownFieldWidgetState extends State<DropdownFieldWidget> {
  String? dropdownValue;

  @override
  void initState() {
    super.initState();

    dropdownValue = widget.value;
  }

  void changeDropdownValue(String? value) {
    final handledValue = value?.toLowerCase();
    if (handledValue == dropdownValue) return;

    setState(() {
      dropdownValue = handledValue;
    });

    widget.onChanged(dropdownValue!);
  }

  String capitalize(String value) {
    final firstLetter = value[0].toUpperCase();
    final rest = value.substring(1);
    return '$firstLetter$rest';
  }

  @override
  Widget build(BuildContext context) {
    return CustomFieldWidget(
      label: 'Sexo',
      isRequired: true,
      field: DropdownButtonFormField(
        onChanged: changeDropdownValue,
        value: dropdownValue, // initialValue
        validator: (value) {
          if (value == null) return 'Campo obrigatório';
          return null;
        },
        items: widget.values.map((e) {
          return DropdownMenuItem(
            value: e.toLowerCase(),
            child: Text(capitalize(e)),
          );
        }).toList(),
        decoration: const InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
