import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../../../resources/app_strings.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String>? onFieldSubmitted;

  const EmailField({required this.onFieldSubmitted,required this.controller, required this.focusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: Theme.of(context).primaryColor,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
      keyboardType: TextInputType.text,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) => _validator(value),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelText: AppStrings.email,
        hintText: AppStrings.enterEmailAddress,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (!EmailValidator.validate(value)) {
      return AppStrings.incorrectEmail;
    }
    return null;
  }
}
