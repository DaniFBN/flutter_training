// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.formatters,
    this.autofill,
    this.obscureText = false,
    this.maxLength,
    this.suffix,
    this.validator,
    this.required = false,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final List<TextInputFormatter>? formatters;
  final List<String>? autofill;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool required;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: formatters,
      obscureText: obscureText,
      autofillHints: autofill,
      maxLength: maxLength,
      focusNode: focusNode,
      readOnly: readOnly,
      onTap: onTap,
      validator: (value) {
        if (required) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
        }

        if (value != null && value.isNotEmpty && validator != null) {
          return validator!(value);
        }

        return null;
      },
      // enabled: false,
      // buildCounter: (
      //   BuildContext _, {
      //   required int currentLength,
      //   required bool isFocused,
      //   required int? maxLength,
      // }) {
      //   return Text('$currentLength de $maxLength');
      // },
      // obscuringCharacter: '*',
      // keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        suffixIcon: suffix,
        filled: true,
        hintText: hintText,
        errorStyle: const TextStyle(fontSize: 12),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
