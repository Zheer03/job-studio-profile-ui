import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

class ExternalLinkTileWidget extends StatelessWidget {
  const ExternalLinkTileWidget({
    super.key,
    this.onTap,
    this.leadingIcon,
    this.leadingIconColor,
    this.leading,
    required this.title,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.trailingText,
    this.trailingTextColor,
    this.trailingTextFontSize,
    this.trailingTextFontWeight,
    this.trailing,
    this.backgroundColor,
    this.foregroundColor,
    this.divider = true,
    this.dividerColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
  });

  final VoidCallback? onTap;
  final String? leadingIcon;
  final Color? leadingIconColor;
  final Widget? leading;
  final String title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final String? trailingText;
  final Color? trailingTextColor;
  final double? trailingTextFontSize;
  final FontWeight? trailingTextFontWeight;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool divider;
  final Color? dividerColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TileButtonWidget(
      onTap: onTap,
      backgroundColor: backgroundColor,
      leadingRightPadding: 2.0,
      contentPadding: padding,
      leading: IntrinsicHeight(
        child: Row(
          children: [
            if (leading != null)
              leading!
            else
              SvgIcon(
                name: leadingIcon ?? SvgIcons.check,
                width: 20,
                height: 20,
                color: leadingIconColor ??
                    foregroundColor ??
                    Theme.of(context).colorScheme.onPrimary,
              ),
            if (leading != null) leading! else const Gap(2.0),
            if (divider)
              VerticalDivider(
                indent: 3,
                endIndent: 3,
                color: dividerColor ??
                    foregroundColor ??
                    Theme.of(context).colorScheme.onPrimary,
              ),
          ],
        ),
      ),
      title: title,
      titleFontSize: titleFontSize ?? 13,
      titleColor: titleColor ??
          foregroundColor ??
          Theme.of(context).colorScheme.onPrimary,
      titleFontWeight: titleFontWeight ?? FontWeight.w600,
      trailing: trailing ??
          (trailingText != null
              ? TextWidget(
                  trailingText!,
                  fontSize: trailingTextFontSize ?? 13,
                  color: trailingTextColor ??
                      foregroundColor ??
                      Theme.of(context).colorScheme.onPrimary,
                  fontWeight: trailingTextFontWeight,
                )
              : null),
    );
  }
}
