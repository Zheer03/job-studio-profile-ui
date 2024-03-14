import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class JobCategoriesScreen extends StatelessWidget {
  static const String routeName = '/job-categories';
  const JobCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        title: 'Job Category',
        textSize: 18,
        textColor: AppColors.systemGray05Dark,
        // textWeight: FontWeight.w600,
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              'Choose your job category',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.systemGray05Dark,
            ),
            const TextWidget(
              'Choose a category for your job',
              fontSize: 16,
              // fontWeight: FontWeight.w600,
              color: AppColors.systemGray,
            ),
            const Gap(16.0),
            const TextFieldWidget(
              prefix: Icon(
                Remix.search_line,
                size: 22,
              ),
              hintText: 'Search',
              fillColor: AppColors.systemGray06Light,
              border: false,
            ),
            const Gap(24.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.logoBlack.withOpacity(.1),
                    // offset: const Offset(0, 4),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Column(
                children: [
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Teaching & Training');
                    },
                    title: 'Teaching & Training',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.first,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Sales & Marketing');
                    },
                    title: 'Sales & Marketing',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Admin & Customer Support');
                    },
                    title: 'Admin & Customer Support',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Web Development');
                    },
                    title: 'Web Development',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Information Technology');
                    },
                    title: 'Information Technology',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Design & Creativity');
                    },
                    title: 'Design & Creativity',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.last,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
