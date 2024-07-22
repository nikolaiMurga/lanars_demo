import 'package:flutter/material.dart';

import '../../../resources/app_strings.dart';
import '../../../resources/app_text_styles.dart';
import '../helpers/app_navigator.dart';
import 'active_button.dart';

class ConfirmDialog extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isDeleteAccDialog;

  const ConfirmDialog({required this.onPressed, this.isDeleteAccDialog = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    AppStrings.logout,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 24),
                    child: Text(
                      AppStrings.areYouSureLogOut,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => AppNavigator().navigateBack(),
                        child: const Text(AppStrings.cancel),
                      ),
                      TextButton(onPressed: () => onPressed(), child: const Text(AppStrings.logout)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
