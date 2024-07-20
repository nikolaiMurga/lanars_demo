import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../../../resources/app_strings.dart';
import '../../../resources/app_text_styles.dart';

mixin ToastMixin {
  showErrorToast(BuildContext context, String message) {
    final fToast = FToast();
    fToast.init(context);
    fToast.showToast(
      child: ToastContent(
        type: AppStrings.errorType,
        message: message,
        icon: AppImages.errorToastIcon,
        color: AppColors.red,
        backgroundColor: AppColors.lightRed,
        typeStyle: AppTextStyles.red16w600,
        messageStyle: AppTextStyles.red14w400,
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }
}

class ToastContent extends StatelessWidget {
  final String type;
  final String message;
  final String icon;
  final Color color;
  final Color backgroundColor;
  final TextStyle typeStyle;
  final TextStyle messageStyle;

  const ToastContent({
    super.key,
    required this.type,
    required this.message,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    required this.typeStyle,
    required this.messageStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textWith = MediaQuery.sizeOf(context).width - 140;
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor,
        border: Border.all(width: 1, color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(icon, height: 24, width: 24, color: color),
          const SizedBox(width: 12.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(type, style: typeStyle),
              SizedBox(width: textWith, child: Text(message, style: messageStyle, maxLines: 5, overflow: TextOverflow.visible)),
            ],
          ),
        ],
      ),
    );
  }
}
