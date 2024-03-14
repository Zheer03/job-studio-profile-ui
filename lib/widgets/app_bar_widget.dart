import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

AppBar? appBarWidget({
  final SystemUiOverlayStyle? systemUiOverlayStyle,
  final bool hasBackButton = true,
  final Widget? widget,
  final String? title,
  final Color textColor = AppColors.systemGray05Dark,
  final double textSize = 20.0,
  final FontWeight textWeight = FontWeight.w500,
  final bool centerTitle = true,
  final List<Widget>? actions,
  final Color? backgroundColor,
  final double toolbarHeight = 56.0,
  final bool enabled = true,
  final EdgeInsetsGeometry titlePadding = const EdgeInsets.only(left: -0.0),
}) {
  if (enabled) {
    return AppBar(
      systemOverlayStyle: systemUiOverlayStyle,
      leading: hasBackButton
          ? iconButtonWidget(
              onPressed: () {
                Get.back();
              },
              icon: SvgIcons.arrow_back,
              iconColor: AppColors.systemGray06Light,
            )
          : null,
      automaticallyImplyLeading: hasBackButton,
      leadingWidth: 75.0,
      title: title != null
          ? AllowNegativePadding(
              padding: titlePadding,
              child: TextWidget(
                title,
                color: textColor,
                fontSize: textSize,
                fontWeight: textWeight,
              ),
            )
          : widget,
      titleSpacing: 20,
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: toolbarHeight,
      actions: actions,
    );
  }
  return null;
}
