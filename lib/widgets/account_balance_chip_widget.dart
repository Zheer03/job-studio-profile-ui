import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class AccountBalanceChipWidget extends StatelessWidget {
  const AccountBalanceChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.systemGray04Light),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIcon(
            name: SvgIcons.dollar,
            width: 20,
            height: 20,
          ),
          Gap(4.0),
          TextWidget(
            '\$650,000',
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
