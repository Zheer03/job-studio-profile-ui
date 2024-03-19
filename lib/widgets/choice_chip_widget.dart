import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    this.onSelected,
    required this.label,
    this.selected = false,
  });

  final Function(bool value)? onSelected;
  final String label;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      onSelected: onSelected,
      label: TextWidget(
        label,
        color: selected
            ? Theme.of(context).colorScheme.onPrimary
            : AppColors.systemGray,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: selected
              ? Theme.of(context).colorScheme.primary
              : AppColors.systemGray,
        ),
      ),
      // color: MaterialStatePropertyAll(
      //   selected
      //       ? Theme.of(context).colorScheme.primary
      //       : AppColors.transparent,
      // ),
      backgroundColor: Colors.transparent,
      selected: selected,
      selectedColor: Theme.of(context).colorScheme.primary,

      shadowColor: Theme.of(context).colorScheme.primary,

      showCheckmark: false,
    );
  }
}
