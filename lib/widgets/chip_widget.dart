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
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
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
  final Color? iconBackgroundColor;
  final Color? selectedIconBackgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final Color? selectedIconColor;
  final Duration? animationDuration;
  final void Function(String value) onSelected;
  final void Function(String value) onUnselected;

  @override
  State<ChipWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.animationDuration ?? Durations.short1,
      height: 40,
      decoration: BoxDecoration(
        color: selected
            ? widget.selectedBackgroundColor ??
                Theme.of(context).colorScheme.primary
            : widget.backgroundColor ?? AppColors.transparent,
        borderRadius: BorderRadius.circular(32.0),
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(32.0),
        child: InkWell(
          onTap: () {
            setState(() {
              selected = !selected;
            });
            if (selected) {
              widget.onSelected(widget.label);
            } else {
              widget.onUnselected(widget.label);
            }
          },
          borderRadius: BorderRadius.circular(32.0),
          child: AnimatedContainer(
            duration: widget.animationDuration ?? Durations.short1,
            padding: widget.contentPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : AppColors.systemGray03Light,
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
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(16.0),
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
