import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/controllers/profile_controller.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/account_balance_chip_widget.dart';
import 'package:job_studio_profile_ui/widgets/experience_card_widget.dart';
import 'package:job_studio_profile_ui/widgets/external_link_tile_widget.dart';
import 'package:job_studio_profile_ui/views/profile/settings/settings_screen.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/bottom_sheet_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/chip_widget.dart';
import 'package:job_studio_profile_ui/widgets/choice_chip_widget.dart';
import 'package:job_studio_profile_ui/widgets/expandable_page_view.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/portfolio_card_widget.dart';
import 'package:job_studio_profile_ui/widgets/profile_picture_and_cover_widget.dart';
import 'package:job_studio_profile_ui/widgets/recommendation_card_widget.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

// TODO use GetBuilder
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        widget: const SvgIcon(name: SvgIcons.logo),
        hasBackButton: false,
        centerTitle: false,
        actions: [
          const ProfileAppBarButtons(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          // TODO
          return Future.delayed(Durations.extralong1);
        },
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ProfilePictureAndCoverWidget(),
                  Positioned(
                    bottom: 8,
                    child: AccountBalanceChipWidget(),
                  ),
                ],
              ),
              Gap(8.0),
              ProfileDetailsWidget(),
              Gap(16.0),
              Divider(color: AppColors.systemGray03Light, height: 0),
              Gap(16.0),
              ProfileInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileAppBarButtons extends StatefulWidget {
  const ProfileAppBarButtons({super.key});

  @override
  State<ProfileAppBarButtons> createState() => _ProfileAppBarButtonsState();
}

class _ProfileAppBarButtonsState extends State<ProfileAppBarButtons> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
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
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24.0),
                                    border: Border.all(
                                        width: 1.5,
                                        color: AppColors.systemGray02Light),
                                  ),
                                  child: QrImageView(
                                    data:
                                        'https://github.com/Zheer03/job-studio-profile-ui',
                                    size: 176,
                                    padding: EdgeInsets.zero,
                                    eyeStyle: QrEyeStyle(
                                      eyeShape: QrEyeShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    dataModuleStyle: QrDataModuleStyle(
                                      dataModuleShape: QrDataModuleShape.circle,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  ),
                                  // child:  BarcodeWidget(
                                  //   data:
                                  //       'https://github.com/Zheer03/book-tickets',
                                  //   barcode: Barcode.qrCode(),
                                  //   drawText: false,
                                  //   height: 150,
                                  //   width: 150,
                                  //   padding: EdgeInsets.zero,
                                  // ),
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
        ],
      ),
    );
  }
}

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          color: AppColors.systemGray02Light,
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
      ],
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
    return AllowNegativePadding(
      padding: const EdgeInsets.symmetric(horizontal: -16.0),
      child: GetBuilder(
        init: ProfileController.to,
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
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
              const Gap(16.0),
              ExpandablePageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  controller.chips.length,
                  (index) {
                    switch (index) {
                      case 0:
                        final List<String> personalTitlesList = [
                          'Birthday',
                          'Years Of Experience',
                        ];
                        final List<dynamic> personalInfoList = [
                          'April 05 2003',
                          10,
                        ];
                        final List<String> externalLinkTitlesList = [
                          'Linkedin',
                          'Instagram',
                          'Facebook',
                        ];
                        final List<String> externalLinkInfoList = [
                          'zheer-muhamad-14b6a4210',
                          'zheermuhamad03',
                          'zheermuhamad03',
                        ];
                        final List<Color> externalLinkColorsList = [
                          const Color(0xFF0A66C2),
                          const Color(0xFF405DE6),
                          const Color(0xFF1877F2),
                        ];
                        final List<String> educationTitlesList = [
                          'School',
                          'Degree',
                        ];
                        final List<String> educationInfoList = [
                          'Technical College of Informatics',
                          'Bachelor\'s Degree',
                        ];
                        final List<String> badgesList = [
                          SvgIcons.badge1,
                          SvgIcons.badge2,
                          SvgIcons.badge3,
                          SvgIcons.badge4,
                          SvgIcons.badge5,
                          SvgIcons.badge4,
                          SvgIcons.badge3,
                          SvgIcons.badge2,
                          SvgIcons.badge1,
                        ];
                        final List<String> languageTitlesList = [
                          'English',
                          'Kurdish',
                        ];
                        final List<String> languageInfoList = [
                          'Advanced',
                          'Native',
                        ];
                        final List<String> skillsList = [
                          'Graphic Design',
                          'Motion Graphic',
                          'UI/UX Design',
                          'Management',
                          'Multiskilled',
                        ];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextWidget(
                                'Personal',
                                fontWeight: FontWeight.w600,
                              ),
                              const Gap(8.0),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: personalTitlesList.length,
                                itemBuilder: (context, index) {
                                  return TileButtonWidget(
                                    title: personalTitlesList[index],
                                    titleFontWeight: FontWeight.w600,
                                    trailing: TextWidget(
                                      '${personalInfoList[index]}',
                                      fontWeight: FontWeight.w300,
                                    ),
                                    tileButtonPosition:
                                        personalTitlesList[index] ==
                                                personalTitlesList.first
                                            ? TileButtonPosition.first
                                            : personalTitlesList[index] ==
                                                    personalTitlesList.last
                                                ? TileButtonPosition.last
                                                : TileButtonPosition.middle,
                                  );
                                },
                              ),
                              const Gap(16.0),
                              const TextWidget(
                                'External Links',
                                fontWeight: FontWeight.w600,
                              ),
                              const Gap(8.0),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: externalLinkTitlesList.length,
                                itemBuilder: (context, index) {
                                  return ExternalLinkTileWidget(
                                    backgroundColor:
                                        externalLinkColorsList[index],
                                    title: externalLinkTitlesList[index],
                                    trailingText: externalLinkInfoList[index],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Gap(8.0);
                                },
                              ),
                              const Gap(16.0),
                              const TextWidget(
                                'Education',
                                fontWeight: FontWeight.w600,
                              ),
                              const Gap(8.0),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: educationTitlesList.length,
                                itemBuilder: (context, index) {
                                  return TileButtonWidget(
                                    title: educationTitlesList[index],
                                    titleFontWeight: FontWeight.w600,
                                    trailing: TextWidget(
                                      educationInfoList[index],
                                      fontWeight: FontWeight.w300,
                                    ),
                                    tileButtonPosition:
                                        personalTitlesList[index] ==
                                                personalTitlesList.first
                                            ? TileButtonPosition.first
                                            : personalTitlesList[index] ==
                                                    personalTitlesList.last
                                                ? TileButtonPosition.last
                                                : TileButtonPosition.middle,
                                  );
                                },
                              ),
                              const Gap(16.0),
                              const TextWidget(
                                'Badges',
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 64,
                                child: AllowNegativePadding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: -16.0),
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    shrinkWrap: true,
                                    itemCount: badgesList.length,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          SvgIcon(name: badgesList[index]),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Gap(24.0);
                                    },
                                  ),
                                ),
                              ),
                              const Gap(16.0),
                              const TextWidget(
                                'Languages',
                                fontWeight: FontWeight.w600,
                              ),
                              const Gap(8.0),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: languageTitlesList.length,
                                itemBuilder: (context, index) {
                                  return TileButtonWidget(
                                    title: languageTitlesList[index],
                                    titleFontWeight: FontWeight.w600,
                                    trailing: TextWidget(
                                      languageInfoList[index],
                                      fontWeight: FontWeight.w300,
                                    ),
                                    tileButtonPosition:
                                        languageTitlesList[index] ==
                                                languageTitlesList.first
                                            ? TileButtonPosition.first
                                            : languageTitlesList[index] ==
                                                    languageTitlesList.last
                                                ? TileButtonPosition.last
                                                : TileButtonPosition.middle,
                                  );
                                },
                              ),
                              const Gap(16.0),
                              const TextWidget(
                                'Skills',
                                fontWeight: FontWeight.w600,
                              ),
                              const Gap(8.0),
                              Wrap(
                                spacing: 8.0,
                                runSpacing: 8.0,
                                children: List.generate(
                                  skillsList.length,
                                  (index) => ChipWidget(
                                    label: skillsList[index],
                                    labelSize: 14,
                                    labelWeight: FontWeight.w500,
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    onSelected: null,
                                    onUnselected: null,
                                    hasTrailingIcon: false,
                                    borderColor: AppColors.systemGray,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              const Gap(64.0),
                            ],
                          ),
                        );

                      case 1:
                        final List<String> recommendationNames = [
                          'Amanj Ali',
                          'Mhamad Kamaran',
                          'Leslie Alexander',
                          'Hasan Omer',
                        ];
                        final List<String> recommendationImages = [
                          'assets/img/person1.png',
                          'assets/img/person2.png',
                          'assets/img/person3.png',
                          'assets/img/person4.png',
                        ];
                        final List<int> recommendationRatings = [
                          4,
                          5,
                          3,
                          2,
                        ];
                        return Column(
                          children: [
                            ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              primary: false,
                              itemBuilder: (context, index) {
                                return RecommendationCardWidget(
                                  profileImage: recommendationImages[index],
                                  name: recommendationNames[index],
                                  rating: recommendationRatings[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Gap(16.0);
                              },
                              itemCount: 4,
                            ),
                            const Gap(64.0),
                          ],
                        );

                      case 2:
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              ButtonWidget(
                                onPressed: () {},
                                text: '',
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                              AllowNegativePadding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: -0.0),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  primary: false,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 193 / 133,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return const PortfolioCardWidget();
                                  },
                                ),
                              ),
                              const Gap(32.0),
                            ],
                          ),
                        );

                      case 3:
                        return Column(
                          children: [
                            ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              physics: const NeverScrollableScrollPhysics(),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const ExperienceCardWidget(
                                  jobTitle: 'Motion Graphic Designer',
                                  dateStarted: '2023',
                                  dateEnded: 'Present',
                                  location: 'Click Iraq',
                                  jobType: 'Full-Time',
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Gap(16.0);
                              },
                            ),
                            const Gap(32.0),
                          ],
                        );

                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
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
