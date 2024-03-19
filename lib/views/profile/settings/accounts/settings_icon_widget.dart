import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({
    super.key,
    this.svgIcon,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.padding = const EdgeInsets.all(6.0),
    this.cardSize = 28,
    this.iconSize,
    this.animationDuration,
    this.shape = BoxShape.rectangle,
    this.loading = false,
  });

  final SvgIcon? svgIcon;
  final String icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsetsGeometry padding;
  final double cardSize;
  final double? iconSize;
  final Duration? animationDuration;
  final BoxShape shape;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration ?? Durations.medium4,
      height: cardSize,
      width: cardSize,
      padding: padding,
      decoration: BoxDecoration(
        shape: shape,
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius:
            shape == BoxShape.rectangle ? BorderRadius.circular(8.0) : null,
      ),
      child: AnimatedContainer(
        duration: animationDuration ?? Durations.medium4,
        child: loading
            ? const CircularProgressIndicator(
                color: AppColors.systemWhite,
                strokeWidth: 1.5,
              )
            : svgIcon ??
                SvgIcon(
                  name: icon,
                  width: iconSize,
                  height: iconSize,
                  color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
                ),
      ),
    );
  }
}
