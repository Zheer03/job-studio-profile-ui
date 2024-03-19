import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  const ExperienceCardWidget({
    super.key,
    required this.jobTitle,
    required this.dateStarted,
    required this.dateEnded,
    required this.location,
    required this.jobType,
  });
  final String jobTitle;
  final String dateStarted;
  final String dateEnded;
  final String location;
  final String jobType;

  @override
  Widget build(BuildContext context) {
    return TileButtonWidget(
      title: jobTitle,
      titleFontSize: 16,
      titleFontWeight: FontWeight.w600,
      subtitleText: '$location - $jobType',
      subtitleFontSize: 12,
      contentPadding: const EdgeInsets.all(16.0),
      trailing: AllowNegativePadding(
        padding: const EdgeInsets.only(top: -12),
        child: TextWidget(
          '$dateStarted - $dateEnded',
          fontSize: 12,
          color: AppColors.systemGray,
        ),
      ),
    );
  }
}
