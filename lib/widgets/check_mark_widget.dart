import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';

class CheckMarkWidget extends StatelessWidget {
  const CheckMarkWidget({
    super.key,
    required this.selected,
    this.animationDuration,
    this.iconSize,
    this.backgroundColor,
    this.iconColor,
    this.icon,
    this.border = false,
  });

  final bool selected;
  final Duration? animationDuration;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final String? icon;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration ?? Durations.short3,
      padding: selected
          ? backgroundColor != null && border
              ? const EdgeInsets.all(2.0)
              : backgroundColor != null
                  ? const EdgeInsets.all(4.0)
                  : border
                      ? const EdgeInsets.all(2.0)
                      : null
          : null,
      decoration: BoxDecoration(
        color: selected
            ? backgroundColor ?? backgroundColor?.withOpacity(0)
            : backgroundColor?.withOpacity(0),
        shape: BoxShape.circle,
        border: border
            ? Border.all(
                width: 2,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.systemGray,
              )
            : null,
      ),
      width: border ? 20 : null,
      height: border ? 20 : null,
      child: AnimatedContainer(
        duration: animationDuration ?? Durations.medium4,
        width: border
            ? null
            : selected
                ? (iconSize ?? 16)
                : 0,
        height: border
            ? null
            : selected
                ? (iconSize ?? 16)
                : 0,
        child: selected
            ? SvgIcon(
                name: icon ?? SvgIcons.check,
                width: iconSize,
                height: iconSize,
                color: iconColor ?? Theme.of(context).colorScheme.onBackground,
              )
            : null,
      ),
    );
  }
}
