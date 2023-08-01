import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.formatters,
    this.autofill,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.suffix,
    this.validator,
    this.isRequired = false,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final List<TextInputFormatter>? formatters;
  final List<String>? autofill;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool isRequired;
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
      readOnly: readOnly,
      onTap: onTap,
      validator: (value) {
        if (isRequired) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
        }

        if (value != null && value.isNotEmpty && validator != null) {
          return validator!(value);
        }

        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffix,
        filled: true,
        hintText: hintText,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
