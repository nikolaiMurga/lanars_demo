import 'package:flutter/material.dart';

mixin ModalDialogMixin {
  Future<Object?> showModalDialog(BuildContext context, {required Widget child}) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (builderContext) => child,
    );
  }
}
