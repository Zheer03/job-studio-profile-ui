import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/settings_icon_widget.dart';
import 'package:job_studio_profile_ui/widgets/check_mark_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class RadioButtonCardWidget extends StatelessWidget {
  const RadioButtonCardWidget({
    super.key,
    required this.onTap,
    required this.selected,
    this.svgIcon,
    required this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    required this.title,
    this.text,
    this.description,
    this.borderWidth,
  });

  final VoidCallback onTap;
  final bool selected;
  final SvgIcon? svgIcon;
  final String icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final String title;
  final String? text;
  final String? description;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
              color: AppColors.logoBlack.withOpacity(.08),
              blurRadius: 16,
              offset: const Offset(0, 16)
              // blurStyle: BlurStyle.solid,
              ),
        ],
      ),
      child: Material(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onTap,
          child: AnimatedContainer(
            duration: Durations.medium4,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary.withOpacity(0),
                width: borderWidth ?? 2,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SettingsIconWidget(
                      svgIcon: svgIcon,
                      icon: icon,
                      padding: const EdgeInsets.all(6),
                      backgroundColor: iconBackgroundColor ??
                          (selected
                              ? Theme.of(context).colorScheme.primary
                              : AppColors.systemGray06Light),
                      iconColor: iconColor ??
                          (selected
                              ? Theme.of(context).colorScheme.onPrimary
                              : AppColors.systemGray05Dark),
                    ),
                    const Gap(8.0),
                    TextWidget(
                      title,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const Spacer(),
                    CheckMarkWidget(
                      animationDuration: Durations.medium4,
                      selected: selected,
                      icon: SvgIcons.check,
                      backgroundColor: selected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0),
                      iconColor: selected
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0),
                      border: true,
                    )
                  ],
                ),
                if (text != null) const Gap(10.0),
                if (text != null)
                  TextWidget(
                    text!,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                if (text == null && description != null) const Gap(4.0),
                if (description != null) const Gap(4.0),
                if (description != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextWidget(
                      description!,
                      color: AppColors.systemGray,
                      fontWeight: FontWeight.w500,
                      height: 1.1,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
