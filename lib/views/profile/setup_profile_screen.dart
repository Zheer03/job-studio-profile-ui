import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:job_studio_profile_ui/views/profile/choose_categories_screen.dart';
import 'package:job_studio_profile_ui/views/profile/job_categories_screen.dart';
import 'package:job_studio_profile_ui/views/profile/locations_screen.dart';
import 'package:job_studio_profile_ui/widgets/ai_text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/bottom_sheet_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/check_mark_widget.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';
import 'package:validators/validators.dart';

class SetupProfileScreen extends StatefulWidget {
  static const String routeName = '/setup-profile';
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
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

  @override
  Widget build(BuildContext context) {
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
        // toolbarHeight: 70,
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
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SetupAccountInfoWidget(),
        ),
      ),
    );
  }
}

class SetupAccountInfoWidget extends StatelessWidget {
  const SetupAccountInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Your Account Info',
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.systemGray05Dark,
        ),
        TextWidget(
          'Upload company profile picture',
          fontSize: 16,
          // fontWeight: FontWeight.w600,
          color: AppColors.systemGray,
        ),
        Gap(16.0),
        ProfilePictureAndCoverWidget(),
        Gap(24.0),
        EditProfileFormWidget(),
        Gap(24.0),
      ],
    );
  }
}

class ProfilePictureAndCoverWidget extends StatefulWidget {
  const ProfilePictureAndCoverWidget({
    super.key,
  });

  @override
  State<ProfilePictureAndCoverWidget> createState() =>
      _ProfilePictureAndCoverWidgetState();
}

class _ProfilePictureAndCoverWidgetState
    extends State<ProfilePictureAndCoverWidget> {
  ImageProvider profileImage = const AssetImage('assets/img/transparent.png');
  bool hasProfileImage = false;
  ImageProvider coverImage = const AssetImage('assets/img/transparent.png');
  bool hasCoverImage = false;

  @override
  Widget build(BuildContext context) {
    return AllowNegativePadding(
      padding: const EdgeInsets.symmetric(horizontal: -16.0),
      child: Stack(
        // alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.topCenter,
            // color: Colors.amber,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.27,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              child: ClipRect(
                child: Material(
                  color: Theme.of(context).colorScheme.background,
                  shape: const LinearBorder(),
                  child: Ink.image(
                    image: coverImage,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () async {
                        final result = await FilePicker.platform.pickFiles(
                          type: FileType.image,
                        );

                        if (result?.files.first == null) return;

                        final PlatformFile image = result!.files.first;

                        final imageFile = File('${image.path}');
                        final newImage =
                            await File('${image.path}').copy(imageFile.path);

                        log('$newImage');
                        setState(() {
                          coverImage = FileImage(newImage);
                          hasCoverImage = true;
                        });
                      },
                      child: hasCoverImage
                          ? null
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgIcon(name: SvgIcons.camera),
                                Gap(4.0),
                                TextWidget(
                                  'The cover size must be 1920 x 1080',
                                  fontSize: 12,
                                  height: 0.7,
                                  // fontWeight: FontWeight.w600,
                                  color: AppColors.systemGray,
                                ),
                              ],
                            ),
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
              child: ClipOval(
                child: Material(
                  color: Theme.of(context).colorScheme.background,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: AppColors.systemGray04Light,
                      width: 1.5,
                    ),
                  ),
                  child: InkWell(
                    onTap: () async {
                      final result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                      );

                      if (result?.files.first == null) return;

                      final PlatformFile image = result!.files.first;

                      final imageFile = File('${image.path}');
                      final newImage =
                          await File('${image.path}').copy(imageFile.path);

                      log('$newImage');
                      setState(() {
                        profileImage = FileImage(newImage);
                        hasProfileImage = true;
                      });
                    },
                    child: CircleAvatar(
                      radius: 53,
                      backgroundColor: AppColors.transparent,
                      backgroundImage: profileImage,
                      child: hasProfileImage
                          ? null
                          : const SvgIcon(name: SvgIcons.camera_green),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileFormWidget extends StatefulWidget {
  const EditProfileFormWidget({
    super.key,
  });

  @override
  State<EditProfileFormWidget> createState() => _EditProfileFormWidgetState();
}

class _EditProfileFormWidgetState extends State<EditProfileFormWidget> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController taglineController;
  late TextEditingController experienceController;
  late TextEditingController genderController;
  late TextEditingController jobCategoryController;
  late TextEditingController locationController;
  late TextEditingController bioController;
  late TextEditingController dateController;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    taglineController = TextEditingController();
    experienceController = TextEditingController();
    genderController = TextEditingController();
    jobCategoryController = TextEditingController();
    locationController = TextEditingController();
    bioController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    taglineController.dispose();
    experienceController.dispose();
    genderController.dispose();
    jobCategoryController.dispose();
    locationController.dispose();
    bioController.dispose();
    dateController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  bool textFieldError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextFormField(
            controller: firstNameController,
            hintText: 'First Name',
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'First Name is required';
              } else if (!isAlpha(value.trim())) {
                return 'Name should consist of only letters';
              } else {
                return null;
              }
            },
            error: textFieldError,
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            controller: lastNameController,
            hintText: 'Last Name',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Last Name is required';
              } else if (!isAlpha(value.trim())) {
                return 'Name should consist of only letters';
              } else {
                return null;
              }
            },
            error: textFieldError,
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            controller: taglineController,
            hintText: 'Tagline | Expertise',
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            controller: experienceController,
            hintText: 'Years of experience',
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            onTap: () async {
              final String result =
                  await Get.toNamed(JobCategoriesScreen.routeName);
              setState(() {
                jobCategoryController.text = result;
              });
            },
            controller: jobCategoryController,
            hintText: 'Job Category',
            keyboardType: TextInputType.none,
            canRequestFocus: false,
            suffix: IconButtonWidget(
              onPressed: jobCategoryController.text.isNotEmpty
                  ? () {
                      setState(() {
                        jobCategoryController.clear();
                      });
                    }
                  : null,
              icon: jobCategoryController.text.isNotEmpty
                  ? SvgIcons.close
                  : SvgIcons.arrow_forward,
              iconWidth: 18,
              iconHeight: 18,
              iconColor: AppColors.systemGray,
              backgroundColor: AppColors.transparent,
            ),
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            onTap: () {
              bottomSheetWidget(
                GendersListWidget(
                  selectedGender: genderController.text,
                  onChanged: (gender) async {
                    setState(() {
                      if (gender != 'Gender') {
                        genderController.text = gender;
                      } else {
                        genderController.text = '';
                      }
                    });
                    Get.back();
                  },
                ),
                elevation: 0,
              );
            },
            controller: genderController,
            hintText: 'Gender',
            keyboardType: TextInputType.none,
            canRequestFocus: false,
            suffix: IconButtonWidget(
              onPressed: genderController.text.isNotEmpty
                  ? () {
                      setState(() {
                        genderController.clear();
                      });
                    }
                  : null,
              icon: genderController.text.isNotEmpty
                  ? SvgIcons.close
                  : SvgIcons.arrow_forward,
              iconWidth: 18,
              iconHeight: 18,
              iconColor: AppColors.systemGray,
              backgroundColor: AppColors.transparent,
            ),
          ),
          const Gap(16.0),
          AnimatedTextFormField(
            onTap: () async {
              final String result =
                  await Get.toNamed(LocationsScreen.routeName);
              setState(() {
                locationController.text = result;
              });
            },
            controller: locationController,
            hintText: 'Location',
            keyboardType: TextInputType.none,
            canRequestFocus: false,
            suffix: IconButtonWidget(
              onPressed: locationController.text.isNotEmpty
                  ? () {
                      setState(() {
                        locationController.clear();
                      });
                    }
                  : null,
              icon: locationController.text.isNotEmpty
                  ? SvgIcons.close
                  : SvgIcons.arrow_forward,
              iconWidth: 18,
              iconHeight: 18,
              iconColor: AppColors.systemGray,
              backgroundColor: AppColors.transparent,
            ),
          ),
          const Gap(16.0),
          AITextFieldWidget(
            controller: bioController,
            hintText: 'Bio',
            minLines: 10,
          ),
          const Gap(16.0),
          const TextWidget(
            'BIRTHDAY',
            color: AppColors.systemGray,
          ),
          const Gap(8.0),
          AnimatedTextFormField(
            onTap: () async {
              bottomSheetWidget(
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.25,
                          child: CupertinoDatePicker(
                            minimumDate: DateTime(1950),
                            maximumDate: DateTime(DateTime.now().year,
                                DateTime.now().month, DateTime.now().day + 1),
                            onDateTimeChanged: (value) {
                              setState(() {
                                dateController.text =
                                    '${value.year}-${value.month}-${value.day}';
                              });
                            },
                            mode: CupertinoDatePickerMode.date,
                          ),
                        ),
                        const Gap(8.0),
                        ButtonWidget(
                          onPressed: () {
                            Get.back();
                          },
                          text: 'Next',
                        ),
                        const Gap(8.0),
                      ],
                    ),
                  ),
                ),
              );
            },
            controller: dateController,
            hintText: 'Date',
            keyboardType: TextInputType.none,
            canRequestFocus: false,
            suffix: IconButtonWidget(
              onPressed: dateController.text.isNotEmpty
                  ? () {
                      setState(() {
                        dateController.clear();
                      });
                    }
                  : null,
              icon: dateController.text.isNotEmpty
                  ? SvgIcons.close
                  : SvgIcons.arrow_forward,
              iconWidth: 18,
              iconHeight: 18,
              iconColor: AppColors.systemGray,
              backgroundColor: AppColors.transparent,
            ),
          ),
          const Gap(16.0),
          const TextWidget(
            'CV',
            color: AppColors.systemGray,
          ),
          const Gap(8.0),
          const UploadCVWidget(),
          const Gap(48.0),
          ButtonWidget(
            onPressed: () {
              FocusScope.of(context).unfocus();
              setState(() {
                textFieldError = !formKey.currentState!.validate();
              });
              Get.offAllNamed(ChooseCategoriesScreen.routeName);
              if (!textFieldError) {
                log('error: $textFieldError');
              } else {
                log('error: $textFieldError');
              }
            },
            text: 'Next',
          ),
        ],
      ),
    );
  }
}

class UploadCVWidget extends StatefulWidget {
  const UploadCVWidget({
    super.key,
  });

  @override
  State<UploadCVWidget> createState() => _UploadCVWidgetState();
}

class _UploadCVWidgetState extends State<UploadCVWidget> {
  File? selectedFile;
  String? selectedFileName;
  @override
  Widget build(BuildContext context) {
    return TileButtonWidget(
      onTap: () async {
        log('FilePicker');
        final result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'docx'],
        );
        log('${result?.files.first}');
        if (result?.files.first == null) return;

        final PlatformFile platformFile = result!.files.first;
        final file = File('${platformFile.path}');

        log('$file');
        setState(() {
          selectedFile = file;
          selectedFileName = platformFile.name;
        });
      },
      leading: IntrinsicHeight(
        child: Row(
          children: [
            SvgIcon(
              name: SvgIcons.upload_cv,
              color: Theme.of(context).colorScheme.primary,
              width: 20,
              height: 20,
            ),
            const Gap(4.0),
            const VerticalDivider(
              indent: 3,
              endIndent: 3,
            ),
          ],
        ),
      ),
      title: selectedFileName ?? 'Upload your CV',
      titleColor: AppColors.systemGray05Dark,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      titleFontSize: 13,
      titleFontWeight: FontWeight.w600,
      backgroundColor: Theme.of(context).colorScheme.background,
      leadingRightPadding: 4.0,
      trailing: const TextWidget(
        'MAX 5.0 MB',
        fontSize: 11,
        color: AppColors.systemGray,
      ),
    );
  }
}

class GendersListWidget extends StatelessWidget {
  const GendersListWidget({
    super.key,
    required this.onChanged,
    required this.selectedGender,
  });

  final Function(String gender) onChanged;
  final String selectedGender;

  @override
  Widget build(BuildContext context) {
    List<String> genders = ['Gender', 'Male', 'Female', 'Other'];
    return Container(
      padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
      child: Column(
        children: List.generate(
          genders.length,
          (index) {
            final gender = genders[index];
            return TileButtonWidget(
              onTap: () => onChanged(gender),
              title: gender,
              splash: true,
              splashColor: AppColors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              backgroundColor: AppColors.transparent,
              titleFontSize: 16,
              defaultTrailing: true,
              trailing: CheckMarkWidget(
                selected: selectedGender == gender,
                animationDuration: Durations.short3,
              ),
              dividerIndent: 16,
              dividerEndIndent: 16,
              tileButtonPosition: genders.first == gender
                  ? TileButtonPosition.first
                  : genders.last == gender
                      ? TileButtonPosition.last
                      : TileButtonPosition.middle,
            );
          },
        ),
      ),
    );
  }
}

class DropdownButtonFormFieldWidget extends StatelessWidget {
  const DropdownButtonFormFieldWidget({
    super.key,
    required this.onChanged,
    this.dropdownColor,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 3.0, vertical: 14.0),
    this.items,
  });

  final void Function(dynamic value)? onChanged;
  final Color? dropdownColor;
  final EdgeInsetsGeometry contentPadding;
  final List<String>? items;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.systemGray,
        ),
        elevation: 4,
        dropdownColor: dropdownColor ?? AppColors.systemWhite,
        isExpanded: true,
        borderRadius: BorderRadius.circular(12.0),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppColors.systemGray02Light,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppColors.systemGray02Light,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: AppColors.systemRed.shade600,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: AppColors.systemRed.shade600,
            ),
          ),
        ),
        items: items
            ?.map(
              (value) => DropdownMenuItem(
                value: value == items?.first ? null : value,
                child: TextWidget(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
