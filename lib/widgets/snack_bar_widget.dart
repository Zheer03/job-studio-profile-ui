import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

SnackbarController snackBarWidget({
  String? title,
  double? titleHeight,
  String? message,
  double? messageHeight,
  Color? backgroundColor,
  Duration? duration,
}) =>
    Get.showSnackbar(
      GetSnackBar(
        snackStyle: SnackStyle.GROUNDED,
        padding: const EdgeInsets.only(
            left: 24.0, right: 24.0, top: 16.0, bottom: 14.0),
        titleText: title != null
            ? TextWidget(
                title,
                color: AppColors.systemWhite,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: titleHeight,
              )
            : null,
        messageText: message != null
            ? TextWidget(
                message,
                color: AppColors.systemWhite,
                fontWeight: FontWeight.w500,
                height: messageHeight,
              )
            : null,
        duration: duration ?? const Duration(seconds: 2),
        animationDuration: Durations.extralong1,
        backgroundColor: backgroundColor ?? const GetSnackBar().backgroundColor,
      ),
    );
