import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

enum TileButtonPosition { first, middle, last }

// ignore: must_be_immutable
class TileButtonWidget extends StatelessWidget {
  TileButtonWidget({
    super.key,
    this.onTap,
    required this.title,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.subtitleText,
    this.subtitleColor,
    this.subtitleFontSize,
    this.subtitleFontWeight,
    this.subtitle,
    this.tileButtonPosition,
    this.backgroundColor,
    this.leading,
    this.trailing,
    this.defaultTrailing = false,
    this.bottomDivider = true,
    this.dividerIndent = 62,
    this.dividerEndIndent,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    this.leadingRightPadding = 16.0,
    this.border,
    this.splash = false,
    this.splashColor,
    this.splashHighlightColor,
    this.headerText,
    this.shadow = false,
    this.borderRadius,
  });

  final VoidCallback? onTap;
  final String title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final String? subtitleText;
  final Color? subtitleColor;
  final double? subtitleFontSize;
  final FontWeight? subtitleFontWeight;
  final Widget? subtitle;
  final TileButtonPosition? tileButtonPosition;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? trailing;
  final bool defaultTrailing;
  final bool bottomDivider;
  final double? dividerIndent;
  final double? dividerEndIndent;
  final EdgeInsetsGeometry? contentPadding;
  final double leadingRightPadding;
  final BoxBorder? border;
  final bool splash;
  final Color? splashColor;
  final Color? splashHighlightColor;
  final String? headerText;
  final bool shadow;
  BorderRadius? borderRadius = BorderRadius.circular(14.0);

  @override
  Widget build(BuildContext context) {
    switch (tileButtonPosition) {
      case TileButtonPosition.first:
        borderRadius = const BorderRadius.vertical(top: Radius.circular(14.0));
        break;
      case TileButtonPosition.middle:
        borderRadius = BorderRadius.zero;
        break;
      case TileButtonPosition.last:
        borderRadius =
            const BorderRadius.vertical(bottom: Radius.circular(14.0));
        break;
      default:
        borderRadius = BorderRadius.circular(14.0);
        break;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadow
            ? [
                BoxShadow(
                  color: AppColors.logoBlack.withOpacity(0.1),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: Material(
        color: backgroundColor ?? AppColors.systemWhite,
        borderRadius: borderRadius,
        elevation: 0,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: splash ? splashColor : AppColors.transparent,
          highlightColor: splash ? splashHighlightColor : AppColors.transparent,
          onTap: onTap,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: contentPadding,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: border,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (headerText?.isNotEmpty ?? false)
                      TextWidget(
                        headerText!,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    if (headerText?.isNotEmpty ?? false) const Gap(8.0),
                    Row(
                      children: [
                        if (leading != null)
                          Padding(
                            padding:
                                EdgeInsets.only(right: leadingRightPadding),
                            child: leading!,
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              title,
                              color: titleColor,
                              fontSize: titleFontSize ?? 14,
                              fontWeight: titleFontWeight ?? FontWeight.w500,
                              // height: 1,
                            ),
                            subtitle ??
                                (subtitleText != null
                                    ? TextWidget(
                                        subtitleText!,
                                        fontSize: subtitleFontSize ?? 10,
                                        fontWeight: subtitleFontWeight ??
                                            FontWeight.w500,
                                        color: subtitleColor ??
                                            AppColors.systemGray,
                                        height: 1,
                                      )
                                    : const SizedBox()),
                          ],
                        ),
                        const Spacer(),
                        if (trailing != null)
                          trailing!
                        else if (defaultTrailing)
                          const SvgIcon(
                            name: SvgIcons.arrow_forward,
                            width: 18,
                            height: 18,
                            color: AppColors.systemGray04Light,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (bottomDivider)
                if (tileButtonPosition == TileButtonPosition.middle ||
                    tileButtonPosition == TileButtonPosition.first)
                  Divider(
                    height: 0,
                    indent: dividerIndent,
                    endIndent: dividerEndIndent,
                    color: AppColors.systemGray04Light,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
