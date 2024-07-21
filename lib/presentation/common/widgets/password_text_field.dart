import 'package:flutter/material.dart';
import '../../../resources/app_strings.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool enabled;

  const PasswordTextField({
    required this.controller,
    required this.focusNode,
    super.key, required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
      validator: (value) => _passwordValidator(value),
      focusNode: focusNode,
      onFieldSubmitted: (v) => focusNode.unfocus(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelText: AppStrings.password,
        hintText: AppStrings.enterPassword,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        enabled: enabled,
      ),
    );
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldIsRequired;
    } else if (value.length < 6 || value.length > 10) {
      return AppStrings.passLength;
    } else if (!passValidate(value)) {
      return AppStrings.passValidation;
    }
    return null;
  }

  bool passValidate(String text) {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{6,10}$');
    return passwordRegex.hasMatch(text);
  }
}
