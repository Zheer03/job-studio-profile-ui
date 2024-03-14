import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';

Future bottomSheetWidget(
  Widget content, {
  Color? backgroundColor,
  bool showDragHandle = true,
  bool? isScrollControlled,
  ShapeBorder? shape,
  double? elevation,
}) async =>
    await Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDragHandle)
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                width: 44,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.systemGray04Light,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          content,
        ],
      ),
      elevation: elevation ?? 0,
      backgroundColor: backgroundColor ?? Colors.white,
      enterBottomSheetDuration: Durations.short4,
      exitBottomSheetDuration: Durations.short4,
      isScrollControlled: isScrollControlled ?? false,
      shape: shape,
    );
