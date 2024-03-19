import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

class RecommendationCardWidget extends StatelessWidget {
  const RecommendationCardWidget({
    super.key,
    required this.profileImage,
    required this.name,
    required this.rating,
    this.text,
    this.createdAt,
  });

  final String profileImage;
  final String name;
  final int rating;
  final String? text;
  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.systemWhite,
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        children: [
          TileButtonWidget(
            contentPadding: const EdgeInsets.all(0.0),
            leading: CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.background,
              backgroundImage: AssetImage(
                profileImage,
              ),
            ),
            leadingRightPadding: 8.0,
            title: name,
            titleFontWeight: FontWeight.w600,
            subtitle: Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: SvgIcon(
                    name: SvgIcons.star,
                    color: index < rating ? null : AppColors.systemGray04Light,
                  ),
                ),
              ).toList(),
            ),
            trailing: const AllowNegativePadding(
              padding: EdgeInsets.only(top: -12),
              child: TextWidget(
                '15 Mar 2024 8:00 AM',
                fontSize: 10,
                color: AppColors.systemGray,
              ),
            ),
            // tileButtonPosition: TileButtonPosition.first,
            // bottomDivider: false,
          ),
          const Gap(16.0),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              // color: AppColors.systemRed,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.0),
              ),
            ),
            child: const TextWidget(
              'Great communication. Timely replies. Attention to detail with great communication',
              fontSize: 12,
              height: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
