import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'custom_field.dart';
import 'custom_text_field.dart';

class AttachField extends StatefulWidget {
  const AttachField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<AttachField> createState() => _AttachFieldState();
}

class _AttachFieldState extends State<AttachField> {
  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['yaml'],
      allowMultiple: true,
    );

    if (result == null) return;

    // final firstFile = result.files.first;
    // final fileName = firstFile.name;

    final filesName = result.files.map((e) => e.name).join(', ');

    widget.controller.text = filesName;
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
      label: 'Anexo',
      field: CustomTextField(
        focusNode: FocusNode(),
        hintText: 'Selecione o anexo',
        controller: widget.controller,
        required: true,
        readOnly: true,
        onTap: getFile,
        // suffix: IconButton(
        //   icon: const Icon(Icons.calendar_month_outlined),
        //   onPressed: selectDate,
        // ),
      ),
    );
  }
}
