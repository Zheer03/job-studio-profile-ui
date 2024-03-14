import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/settings_icon_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    this.labelColor,
    this.selectedLabelColor,
    this.labelWeight,
    this.iconSize,
    this.iconColor,
    this.selectedIconColor,
    this.iconBackgroundColor,
    this.selectedIconBackgroundColor,
    this.animationDuration,
    required this.onSelected,
    required this.onUnselected,
    this.hasTrailingIcon = true,
    this.borderRadius,
    this.borderColor,
    this.selectedBorderColor,
    this.labelSize,
    this.expand = false,
    this.chipWidth,
    this.chipHeight,
  });

  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? selectedBackgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final Color? labelColor;
  final Color? selectedLabelColor;
  final FontWeight? labelWeight;
  final double? labelSize;
  final Color? iconBackgroundColor;
  final Color? selectedIconBackgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final Color? selectedIconColor;
  final Duration? animationDuration;
  final void Function(String value)? onSelected;
  final void Function(String value)? onUnselected;
  final bool hasTrailingIcon;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? selectedBorderColor;
  final bool expand;
  final double? chipWidth;
  final double? chipHeight;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration ?? Durations.short1,
      width: widget.expand ? double.infinity : widget.chipWidth,
      height: widget.chipHeight,
      decoration: BoxDecoration(
        color: selected
            ? widget.selectedBackgroundColor ??
                Theme.of(context).colorScheme.primary
            : widget.backgroundColor ?? AppColors.transparent,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(32.0),
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: widget.borderRadius ?? BorderRadius.circular(32.0),
        child: InkWell(
          onTap: widget.onSelected != null || widget.onUnselected != null
              ? () {
                  setState(() {
                    selected = !selected;
                  });
                  if (selected) {
                    if (widget.onSelected != null) {
                      widget.onSelected!(widget.label);
                    }
                  } else {
                    if (widget.onUnselected != null) {
                      widget.onUnselected!(widget.label);
                    }
                  }
                }
              : null,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(32.0),
          child: AnimatedContainer(
            duration: widget.animationDuration ?? Durations.short1,
            padding: widget.contentPadding,
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(32.0),
              border: Border.all(
                color: selected
                    ? widget.selectedBorderColor ??
                        Theme.of(context).colorScheme.primary
                    : widget.borderColor ?? AppColors.systemGray03Light,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedDefaultTextStyle(
                  duration: widget.animationDuration ?? Durations.short1,
                  style: TextStyle(
                    color: selected
                        ? widget.selectedLabelColor ??
                            Theme.of(context).colorScheme.onPrimary
                        : widget.labelColor ??
                            Theme.of(context).colorScheme.onBackground,
                  ),
                  child: TextWidget(
                    widget.label,
                    fontSize: widget.labelSize ?? 15,
                    fontWeight: widget.labelWeight ?? FontWeight.w600,
                  ),
                ),
                if (widget.hasTrailingIcon) const Gap(16.0),
                if (widget.hasTrailingIcon)
                  SettingsIconWidget(
                    animationDuration:
                        widget.animationDuration ?? Durations.short1,
                    icon: selected ? SvgIcons.check : SvgIcons.plus,
                    backgroundColor: selected
                        ? widget.selectedIconBackgroundColor ??
                            Theme.of(context).colorScheme.onPrimary
                        : widget.iconBackgroundColor ??
                            Theme.of(context).colorScheme.primary,
                    iconColor: selected
                        ? widget.selectedIconColor ??
                            Theme.of(context).colorScheme.primary
                        : widget.iconColor ??
                            Theme.of(context).colorScheme.onPrimary,
                    shape: BoxShape.circle,
                    padding: selected
                        ? const EdgeInsets.all(3)
                        : const EdgeInsets.all(5),
                    cardSize: 22,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
