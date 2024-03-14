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

class LocationsScreen extends StatelessWidget {
  static const String routeName = '/locations';

  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        title: 'Location',
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
              'Choose a location',
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: AppColors.systemGray05Dark,
            ),
            const TextWidget(
              'Define your area and discover relevant opportunities tailored to your preffered location',
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
                    title: 'Iraq',
                    titleFontSize: 16,
                    titleFontWeight: FontWeight.w600,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    contentPadding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 16.0),
                    bottomDivider: false,
                    tileButtonPosition: TileButtonPosition.first,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Baghdad');
                    },
                    title: 'Baghdad',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Erbil');
                    },
                    title: 'Erbil',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Kirkuk');
                    },
                    title: 'Kirkuk',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Mosul');
                    },
                    title: 'Mosul',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Sulaymaniyah');
                    },
                    title: 'Sulaymaniyah',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    tileButtonPosition: TileButtonPosition.middle,
                    bottomDivider: false,
                  ),
                  TileButtonWidget(
                    title: 'Qatar',
                    titleFontSize: 16,
                    titleFontWeight: FontWeight.w600,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    contentPadding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0),
                    bottomDivider: false,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Doha');
                    },
                    title: 'Doha',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Al Wakrah');
                    },
                    title: 'Al Wakrah',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Dukhan');
                    },
                    title: 'Dukhan',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                    bottomDivider: false,
                  ),
                  TileButtonWidget(
                    title: 'United Arab Emirates',
                    titleFontSize: 16,
                    titleFontWeight: FontWeight.w600,
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    contentPadding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 8.0),
                    bottomDivider: false,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Abu Dhabi');
                    },
                    title: 'Abu Dhabi',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Dubai');
                    },
                    title: 'Dubai',
                    titleFontSize: 15,
                    contentPadding: const EdgeInsets.all(16.0),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: TileButtonPosition.middle,
                  ),
                  TileButtonWidget(
                    onTap: () {
                      Get.back(result: 'Sharjah');
                    },
                    title: 'Sharjah',
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
