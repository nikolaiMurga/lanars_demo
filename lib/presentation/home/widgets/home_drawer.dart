import 'package:flutter/material.dart';

import '../../../resources/app_strings.dart';
import '../../common/helpers/app_navigator.dart';
import '../../common/helpers/modal_dialog_mixin.dart';
import '../../common/widgets/confirm_dialog.dart';
import 'drawer_icon_row.dart';

class HomeDrawer extends StatelessWidget with ModalDialogMixin  {
  final VoidCallback onPressed;

  const HomeDrawer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.sizeOf(context).width * 0.74,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, bottom: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: []),
            DrawerIconRow(
              icon: const Icon(Icons.logout_outlined),
              text: AppStrings.logout,
              onPressed: () {
                AppNavigator().navigateBack();
                showModalDialog(context, child: ConfirmDialog(onPressed: onPressed));
              },
            ),
          ],
        ),
      ),
    );
  }
}
