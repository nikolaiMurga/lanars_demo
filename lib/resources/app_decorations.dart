// import 'package:flutter/material.dart';
//
// import 'app_text_styles.dart';
// import 'app_theme.dart';
//
// class AppDecorations {
//   static final InputBorder _border = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(5.0),
//     borderSide: const BorderSide(color: AppTheme.lightGrey, width: 1),
//   );
//
//   static final InputBorder _focusedBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(5.0),
//     borderSide:  BorderSide(color: Theme.of(context).primarySwatch, width: 1),
//   );
//
//   static final InputBorder _focusedErrorBorder = OutlineInputBorder(
//     borderSide: const BorderSide(color: AppTheme.red, width: 1),
//     borderRadius: BorderRadius.circular(5.0),
//   );
//
//   static final InputBorder _errorBorder = OutlineInputBorder(
//     borderSide: const BorderSide(color: AppTheme.red, width: 1),
//     borderRadius: BorderRadius.circular(5.0),
//   );
//
//   static registrationInputDecoration({required String label, required String hint}) => InputDecoration(
//     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
//     labelText: label,
//     hintText: hint,
//     errorStyle: AppTextStyles.red14w400,
//     labelStyle: AppTextStyles.lightGrey16w400,
//     hintStyle: AppTextStyles.lightGrey16w400,
//     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//     enabledBorder: _border,
//     focusedBorder: _focusedBorder,
//     focusedErrorBorder: _focusedErrorBorder,
//     errorBorder: _errorBorder,
//   );
// }