import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/chip_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class ChooseCategoriesScreen extends StatelessWidget {
  static const String routeName = '/choose-categories';
  const ChooseCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
      'Paint',
      'NFL',
      'Music',
      'Developement',
      'Music',
      'Film Production',
      'Writing',
      'Sports',
      'Sports',
      'Movie',
      'NFL',
      'Movie',
      'Graphic &Design',
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
        hasBackButton: false,
        title: 'Setup Account',
        textSize: 16,
        textColor: AppColors.systemGray05Dark,
        textWeight: FontWeight.w600,
        titlePadding: const EdgeInsets.symmetric(horizontal: -4.0),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed(BottomNavBarScreen.routeName);
            },
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(AppColors.transparent),
              foregroundColor: MaterialStatePropertyAll(AppColors.systemGray),
              padding: MaterialStatePropertyAll(
                EdgeInsets.zero,
              ),
            ),
            child: const TextWidget(
              'Skip',
              fontSize: 16,
              color: AppColors.systemGray,
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                'Choose Category',
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: AppColors.systemGray05Dark,
              ),
              const TextWidget(
                'Upload company profile picture',
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
              AllowNegativePadding(
                padding: const EdgeInsets.symmetric(horizontal: -16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.62,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemExtent: 1500,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Wrap(
                        runSpacing: 12.0,
                        spacing: 12.0,
                        children: List.generate(
                          categories.length,
                          (index) => ChipWidget(
                            label: categories[index],
                            onSelected: (value) {
                              log('onSelected: $value');
                            },
                            onUnselected: (value) {
                              log('onUnselected: $value');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonWidget(
                onPressed: () {
                  Get.offAllNamed(BottomNavBarScreen.routeName);
                },
                text: 'Go Home',
              )
            ],
          ),
        ),
      ),
    );
  }
}
