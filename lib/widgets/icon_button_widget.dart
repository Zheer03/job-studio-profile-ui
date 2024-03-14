import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';

Widget iconButtonWidget({
  required VoidCallback onPressed,
  Color backgroundColor = AppColors.systemGray05Dark,
  Color? overlayColor,
  required String icon,
  Color? iconColor,
  double? iconWidth,
  double? iconHeight,
  BoxFit? fit,
}) =>
    Center(
      child: SizedBox(
        height: 38,
        width: 38,
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            overlayColor: MaterialStatePropertyAll(
                overlayColor ?? AppColors.logoGreen.withOpacity(0.1)),
          ),
          icon: SvgIcon(
            name: icon,
            color: iconColor,
            width: iconWidth,
            height: iconHeight,
            fit: fit,
          ),
        ),
      ),
    );

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.overlayColor,
    this.widget,
    required this.icon,
    this.iconColor,
    this.iconWidth,
    this.iconHeight,
    this.fit,
  });

  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? overlayColor;
  final Widget? widget;
  final String icon;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: IconButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
              backgroundColor ?? AppColors.systemGray05Dark),
          overlayColor: MaterialStatePropertyAll(
              overlayColor ?? AppColors.logoGreen.withOpacity(0.1)),
        ),
        icon: widget ??
            SvgIcon(
              name: icon,
              color: iconColor,
              width: iconWidth,
              height: iconHeight,
              fit: fit,
            ),
      ),
    );
  }
}
