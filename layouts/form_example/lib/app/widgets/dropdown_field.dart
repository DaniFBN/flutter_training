import 'package:flutter/material.dart';

class DropdownField extends StatefulWidget {
  const DropdownField({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String value;
  final void Function(String) onChanged;

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  final dropdownValues = ['Flutter', 'React', 'Swift', 'Kotlin'];
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

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: changeDropdownValue,
      value: dropdownValue, // initialValue
      validator: (value) {
        if (value == null) return 'Campo obrigatório';
        return null;
      },
      items: dropdownValues.map((e) {
        return DropdownMenuItem(
          value: e.toLowerCase(),
          child: Text(e),
        );
      }).toList(),
    );
  }
}
