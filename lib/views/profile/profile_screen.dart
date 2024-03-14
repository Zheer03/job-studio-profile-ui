import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/controllers/profile_controller.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/profile/settings/settings_screen.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/bottom_sheet_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/chip_widget.dart';
import 'package:job_studio_profile_ui/widgets/expandable_page_view.dart';
import 'package:job_studio_profile_ui/widgets/full_screen_widget.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';
import 'package:share_plus/share_plus.dart';

// TODO use GetBuilder
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        widget: const SvgIcon(name: SvgIcons.logo),
        hasBackButton: false,
        centerTitle: false,
        actions: [
          IconButtonWidget(
            onPressed: () async {
              setState(() {
                loading = true;
              });
              await Future.delayed(
                Durations.extralong4,
                () async {
                  setState(() {
                    loading = false;
                  });
                  await bottomSheetWidget(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: AppColors.systemWhite,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await Share.share('https://job.studio');
                                      },
                                      child: SvgIcon(
                                        name: SvgIcons.square_and_arrow_up_svg,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                    const Column(
                                      children: [
                                        TextWidget(
                                          'Share',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        TextWidget(
                                          'Scan or copy link',
                                          color: AppColors.systemGray,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: IconButtonWidget(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        iconColor: AppColors.systemGray,
                                        icon: SvgIcons.close,
                                        iconHeight: 22,
                                        iconWidth: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(24.0),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                        width: 1.5,
                                        color: AppColors.systemGray02Light),
                                  ),
                                  child: BarcodeWidget(
                                    data:
                                        'https://github.com/Zheer03/book-tickets',
                                    barcode: Barcode.qrCode(),
                                    drawText: false,
                                    height: 150,
                                    width: 150,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                                const Gap(24.0),
                              ],
                            ),
                          ),
                          const Gap(8.0),
                          ButtonWidget(
                            onPressed: () async {
                              await Clipboard.setData(
                                const ClipboardData(text: 'https://job.studio'),
                              );
                              Get.back();
                              snackBarWidget(
                                title: 'Copied',
                                message: 'Url copied to clipboard',
                                messageHeight: 0.8,
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              );
                            },
                            text: 'Copy',
                          ),
                          const Gap(20.0),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    showDragHandle: false,
                  );
                },
              );
            },
            widget: loading
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: AppColors.systemWhite,
                    ),
                  )
                : null,
            icon: SvgIcons.share,
            iconWidth: loading ? 0 : 14,
            iconHeight: loading ? 0 : 14,
            iconColor: Theme.of(context).colorScheme.onSecondary,
          ),
          const Gap(8.0),
          IconButtonWidget(
            onPressed: () {
              Get.toNamed(SettingsScreen.routeName);
            },
            icon: SvgIcons.settings,
            iconHeight: 18,
            iconWidth: 18,
            iconColor: Theme.of(context).colorScheme.onSecondary,
          ),
          const Gap(16.0),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          // TODO
          return Future.delayed(Durations.extralong1);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AllowNegativePadding(
                padding: const EdgeInsets.only(
                    left: -16.0, right: -16.0, bottom: 0.0),
                child: Stack(
                  // alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      // color: Colors.amber,
                      height: MediaQuery.of(context).size.height * 0.27,
                      child: Container(
                        color: AppColors.systemGray03Light,
                        height: MediaQuery.of(context).size.height * 0.20,
                        child: ClipRect(
                          child: Material(
                            child: Ink.image(
                              fit: BoxFit.cover,
                              image: const AssetImage(
                                  'assets/img/person_cover.png'),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    FullScreenPage.routeName,
                                    arguments: const FullScreenPage(
                                      child: Image(
                                        image: AssetImage(
                                            'assets/img/person_cover.png'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          child: ClipOval(
                            child: Material(
                              color: Colors.transparent,
                              child: CircleAvatar(
                                radius: 53,
                                backgroundColor: AppColors.transparent,
                                child: Ink.image(
                                  image: const AssetImage(
                                      'assets/img/person_profile.jpg'),
                                  fit: BoxFit.cover,
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        FullScreenPage.routeName,
                                        arguments: const FullScreenPage(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/img/person_profile.jpg'),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 12,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: AppColors.systemGray04Light),
                        ),
                        child: const Row(
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
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 12.0, vertical: 8.0),
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(20.0),
              //         border: Border.all(color: AppColors.systemGray04Light),
              //       ),
              //       child: const Row(
              //         children: [
              //           SvgIcon(
              //             name: SvgIcons.dollar,
              //             width: 20,
              //             height: 20,
              //           ),
              //           Gap(4.0),
              //           TextWidget(
              //             '\$ 650,000',
              //             fontWeight: FontWeight.w600,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              const Gap(8.0),
              Row(
                children: [
                  TextWidget(
                    'Zhir Mohammed',
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  const Gap(10.0),
                  const SvgIcon(name: SvgIcons.star),
                  const Gap(4.0),
                  const TextWidget(
                    '3',
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              const TextWidget(
                'Information Technology',
                color: AppColors.systemGray,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.0,
              ),
              const Gap(16.0),
              const TextWidget(
                'Milestone is a method that will allow the business and the freelancer an opportunity to agree on the actions, services, or the payment that are included in the project. With the use of milestones.',
                color: AppColors.systemGray,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const Gap(10.0),
              const Row(
                children: [
                  SvgIcon(
                    name: SvgIcons.location,
                    width: 14,
                    height: 14,
                    color: AppColors.systemGray,
                  ),
                  Gap(6.0),
                  TextWidget(
                    'Iraq, Slemani',
                    color: AppColors.systemGray,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              const Gap(20.0),
              Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColors.systemGray05Light),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.logoBlack.withOpacity(.05),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            '12',
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(4.0),
                          const TextWidget(
                            'Posts',
                            color: AppColors.systemGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const AllowNegativePadding(
                        padding: EdgeInsets.symmetric(vertical: -16.0),
                        child: VerticalDivider(
                          color: AppColors.systemGray05Light,
                        ),
                      ),
                      Row(
                        children: [
                          TextWidget(
                            '7',
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(4.0),
                          const TextWidget(
                            'Year experience',
                            color: AppColors.systemGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const AllowNegativePadding(
                        padding: EdgeInsets.symmetric(vertical: -16.0),
                        child: VerticalDivider(
                          color: AppColors.systemGray05Light,
                        ),
                      ),
                      Row(
                        children: [
                          TextWidget(
                            '3',
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const Gap(4.0),
                          const TextWidget(
                            'Finished tasks',
                            color: AppColors.systemGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(16.0),
              const Divider(
                color: AppColors.systemGray03Light,
                height: 0,
              ),
              const Gap(16.0),
              const ProfileInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoWidget extends StatefulWidget {
  const ProfileInfoWidget({super.key});

  @override
  State<ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<ProfileInfoWidget> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  SelectedChip defaultSelectedChip = SelectedChip.about;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProfileController.to,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AllowNegativePadding(
                padding: const EdgeInsets.symmetric(horizontal: -16.0),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.chips.length,
                      (index) {
                        final chip = controller.chips[index];
                        return Padding(
                          padding: index == controller.chips.length - 1
                              ? const EdgeInsets.only()
                              : const EdgeInsets.only(right: 8.0),
                          child: ChoiceChipWidget(
                            onSelected: (value) {
                              pageController.animateToPage(
                                index,
                                duration: Durations.medium1,
                                curve: Curves.linear,
                              );
                              defaultSelectedChip = chip;
                              controller.updateInfoTabIndex(index);
                            },
                            label: chip.name,
                            selected: defaultSelectedChip == chip,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const Gap(16.0),
              AllowNegativePadding(
                padding: const EdgeInsets.symmetric(horizontal: -16.0),
                child: ExpandablePageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    controller.chips.length,
                    (index) {
                      switch (index) {
                        case 0:
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'Personal',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8.0),
                                    TileButtonWidget(
                                      title: 'Birthday',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        'April 05 2003',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.first,
                                    ),
                                    TileButtonWidget(
                                      title: 'Years of Experience',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        '10',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.last,
                                    ),
                                  ],
                                ),
                                const Gap(16.0),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'External Links',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8.0),
                                    ExternalLinkTileWidget(
                                      backgroundColor: Color(0xFF0A66C2),
                                      title: 'Linkedin',
                                      trailingText: 'zheer-muhamad-14b6a4210',
                                    ),
                                    Gap(8.0),
                                    ExternalLinkTileWidget(
                                      backgroundColor: Color(0xFF405DE6),
                                      title: 'Instagram',
                                      trailingText: 'zheermuhamad03',
                                    ),
                                    Gap(8.0),
                                    ExternalLinkTileWidget(
                                      backgroundColor: Color(0xFF1877F2),
                                      title: 'Facebook',
                                      trailingText: 'Zheer Muhamad',
                                    ),
                                  ],
                                ),
                                const Gap(16.0),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'Education',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8.0),
                                    TileButtonWidget(
                                      title: 'School',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        'Technical College of Informatics',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.first,
                                    ),
                                    TileButtonWidget(
                                      title: 'Degree',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        'Bachelor\'s Degree',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.last,
                                    ),
                                  ],
                                ),
                                const Gap(16.0),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'Badges',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8.0),
                                    AllowNegativePadding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: -16.0),
                                      child: SingleChildScrollView(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            SvgIcon(name: SvgIcons.badge1),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge2),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge3),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge4),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge5),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge4),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge3),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge2),
                                            Gap(24.0),
                                            SvgIcon(name: SvgIcons.badge1),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16.0),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      'Languages',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8.0),
                                    TileButtonWidget(
                                      title: 'English',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        'Advanced',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.first,
                                    ),
                                    TileButtonWidget(
                                      title: 'Kurdish',
                                      titleFontWeight: FontWeight.w600,
                                      trailing: TextWidget(
                                        'Native',
                                        fontWeight: FontWeight.w300,
                                      ),
                                      tileButtonPosition:
                                          TileButtonPosition.last,
                                    ),
                                  ],
                                ),
                                const Gap(16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const TextWidget(
                                      'Skills',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    const Gap(8.0),
                                    Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      children: [
                                        ChipWidget(
                                          label: 'Graphic Design',
                                          labelSize: 14,
                                          labelWeight: FontWeight.w500,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                          onSelected: null,
                                          onUnselected: null,
                                          hasTrailingIcon: false,
                                          borderColor: AppColors.systemGray,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        ChipWidget(
                                          label: 'Motion Graphic',
                                          labelSize: 14,
                                          labelWeight: FontWeight.w500,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                          onSelected: null,
                                          onUnselected: null,
                                          hasTrailingIcon: false,
                                          borderColor: AppColors.systemGray,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        ChipWidget(
                                          label: 'UI/UX Design',
                                          labelSize: 14,
                                          labelWeight: FontWeight.w500,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                          onSelected: null,
                                          onUnselected: null,
                                          hasTrailingIcon: false,
                                          borderColor: AppColors.systemGray,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        ChipWidget(
                                          label: 'Management',
                                          labelSize: 14,
                                          labelWeight: FontWeight.w500,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                          onSelected: null,
                                          onUnselected: null,
                                          hasTrailingIcon: false,
                                          borderColor: AppColors.systemGray,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        ChipWidget(
                                          label: 'Multiskilled',
                                          labelSize: 14,
                                          labelWeight: FontWeight.w500,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                          onSelected: null,
                                          onUnselected: null,
                                          hasTrailingIcon: false,
                                          borderColor: AppColors.systemGray,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Gap(64.0),
                              ],
                            ),
                          );

                        case 1:
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                RecommendationCardWidget(
                                  profileImage: 'assets/img/person1.png',
                                  name: 'Amanj Ali',
                                  rating: 4,
                                ),
                                Gap(16.0),
                                RecommendationCardWidget(
                                  profileImage: 'assets/img/person2.png',
                                  name: 'Mhamad Kamaran',
                                  rating: 4,
                                ),
                                Gap(16.0),
                                RecommendationCardWidget(
                                  profileImage: 'assets/img/person3.png',
                                  name: 'Leslie Alexander',
                                  rating: 3,
                                ),
                                Gap(16.0),
                                RecommendationCardWidget(
                                  profileImage: 'assets/img/person4.png',
                                  name: 'Hasan Omer',
                                  rating: 2,
                                ),
                                Gap(64.0),
                              ],
                            ),
                          );

                        case 2:
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                ButtonWidget(
                                  onPressed: () {},
                                  text: '',
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: SvgIcon(
                                            name: SvgIcons.plus,
                                            width: 16,
                                            height: 16,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                        ),
                                        const Gap(8.0),
                                        TextWidget(
                                          'Add Portfolio',
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.w600,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(16.0),
                                Container(
                                  // TODO dynamic height
                                  height: 400,
                                  child: AllowNegativePadding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: -6.0),
                                    child: GridView.count(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.4,
                                      children: const [
                                        PortfolioCardWidget(),
                                        PortfolioCardWidget(),
                                        PortfolioCardWidget(),
                                        PortfolioCardWidget(),
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(64.0),
                              ],
                            ),
                          );

                        case 3:
                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                ExperienceCardWidget(
                                  jobTitle: 'Motion Graphic Designer',
                                  dateStarted: '2023',
                                  dateEnded: 'Present',
                                  location: 'Click Iraq',
                                  jobType: 'Full-Time',
                                ),
                                Gap(16.0),
                                ExperienceCardWidget(
                                  jobTitle: 'Motion Graphic Designer',
                                  dateStarted: '2023',
                                  dateEnded: 'Present',
                                  location: 'Click Iraq',
                                  jobType: 'Full-Time',
                                ),
                                Gap(16.0),
                                ExperienceCardWidget(
                                  jobTitle: 'Motion Graphic Designer',
                                  dateStarted: '2023',
                                  dateEnded: 'Present',
                                  location: 'Click Iraq',
                                  jobType: 'Full-Time',
                                ),
                                Gap(16.0),
                                ExperienceCardWidget(
                                  jobTitle: 'Motion Graphic Designer',
                                  dateStarted: '2023',
                                  dateEnded: 'Present',
                                  location: 'Click Iraq',
                                  jobType: 'Full-Time',
                                ),
                                Gap(64.0),
                              ],
                            ),
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }
}

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
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.logoBlack.withOpacity(.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextWidget(
                jobTitle,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextWidget(
                '$dateStarted - $dateEnded',
                color: AppColors.systemGray,
              ),
            ],
          ),
          Row(
            children: [
              TextWidget(
                '$location - $location',
                color: AppColors.systemGray,
                height: 1.2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PortfolioCardWidget extends StatelessWidget {
  const PortfolioCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 193 / 133,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: AppColors.systemGray04Light,
          borderRadius: BorderRadius.circular(12.0),
          child: Ink.image(
            image: const AssetImage('assets/img/portfolio1.png'),
            fit: BoxFit.cover,
            child: InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.logoBlack.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                          ),
                        ),
                        // TODO PopUpMenuButton
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Graphic Design',
                          color: AppColors.systemWhite,
                        ),
                        // Gap(2.0),
                        TextWidget(
                          'Obera Social Media Post',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.0,
                          color: AppColors.systemWhite,
                        ),
                        Gap(8.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).colorScheme.background,
                backgroundImage: AssetImage(
                  profileImage,
                ),
              ),
              const Gap(12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    name,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => SvgIcon(
                        name: SvgIcons.star,
                        color:
                            index < rating ? null : AppColors.systemGray04Light,
                      ),
                    ).toList(),
                  ),
                ],
              ),
              const Spacer(),
              const TextWidget(
                '15 Mar 2024 8:00 AM',
                fontSize: 12,
                color: AppColors.systemGray,
              )
            ],
          ),
          const Gap(16.0),
          const TextWidget(
            'Great communication. Timely replies. Attention to detail with great communication',
            fontSize: 12,
            height: 1.2,
          )
        ],
      ),
    );
  }
}

class ExternalLinkTileWidget extends StatelessWidget {
  const ExternalLinkTileWidget({
    super.key,
    this.onTap,
    this.leadingIcon,
    this.leadingIconColor,
    this.leading,
    required this.title,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.trailingText,
    this.trailingTextColor,
    this.trailingTextFontSize,
    this.trailingTextFontWeight,
    this.trailing,
    this.backgroundColor,
    this.foregroundColor,
    this.divider = true,
    this.dividerColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
  });

  final VoidCallback? onTap;
  final String? leadingIcon;
  final Color? leadingIconColor;
  final Widget? leading;
  final String title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final String? trailingText;
  final Color? trailingTextColor;
  final double? trailingTextFontSize;
  final FontWeight? trailingTextFontWeight;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool divider;
  final Color? dividerColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TileButtonWidget(
      onTap: onTap,
      backgroundColor: backgroundColor,
      leadingRightPadding: 2.0,
      contentPadding: padding,
      leading: IntrinsicHeight(
        child: Row(
          children: [
            if (leading != null)
              leading!
            else
              SvgIcon(
                name: leadingIcon ?? SvgIcons.check,
                width: 20,
                height: 20,
                color: leadingIconColor ??
                    foregroundColor ??
                    Theme.of(context).colorScheme.onPrimary,
              ),
            if (leading != null) leading! else const Gap(2.0),
            if (divider)
              VerticalDivider(
                indent: 3,
                endIndent: 3,
                color: dividerColor ??
                    foregroundColor ??
                    Theme.of(context).colorScheme.onPrimary,
              ),
          ],
        ),
      ),
      title: title,
      titleFontSize: titleFontSize ?? 13,
      titleColor: titleColor ??
          foregroundColor ??
          Theme.of(context).colorScheme.onPrimary,
      titleFontWeight: titleFontWeight ?? FontWeight.w600,
      trailing: trailing ??
          (trailingText != null
              ? TextWidget(
                  trailingText!,
                  fontSize: trailingTextFontSize ?? 13,
                  color: trailingTextColor ??
                      foregroundColor ??
                      Theme.of(context).colorScheme.onPrimary,
                  fontWeight: trailingTextFontWeight,
                )
              : null),
    );
  }
}

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

enum SelectedChip {
  about(name: 'About', selectedIndex: 0),
  recommendations(name: 'Recommendations', selectedIndex: 1),
  portfolio(name: 'Portfolio', selectedIndex: 2),
  experience(name: 'Experience', selectedIndex: 3);

  final String name;
  final int selectedIndex;

  const SelectedChip({required this.name, required this.selectedIndex});
}
