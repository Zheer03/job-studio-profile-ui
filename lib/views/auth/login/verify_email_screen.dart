import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/profile/setup_profile_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class VerifyEmailScreen extends StatelessWidget {
  static const String routeName = '/verify-email';
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
        enabled: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
          child: Column(
            children: [
              Center(
                child: SvgIcon(
                  name: SvgIcons.message_picture,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              const Gap(48.0),
              const VerifyEmailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyEmailWidget extends StatelessWidget {
  const VerifyEmailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextWidget(
          'Verify Email Address',
          fontSize: 32,
          fontWeight: FontWeight.w600,
          // color: AppColors.systemGray,
        ),
        const Gap(8.0),
        const TextWidget(
          'We\'ve sent a verify link to your email',
          fontSize: 17,
          textAlign: TextAlign.center,
          // fontWeight: FontWeight.w600,
          color: AppColors.systemGray03Light,
        ),
        const TextWidget(
          '(hhish4m@gmail.com)',
          fontSize: 17,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
          color: AppColors.logoGreen,
        ),
        const TextWidget(
          'Please check your mail and verify your email address with the link in an hour before the link expire.',
          fontSize: 17,
          textAlign: TextAlign.center,
          // fontWeight: FontWeight.w600,
          color: AppColors.systemGray03Light,
        ),
        const Gap(40.0),
        ButtonWidget(
          onPressed: () {
            Get.offAllNamed(SetupProfileScreen.routeName);
            // snackBarWidget(
            //   title: 'Verification Link',
            //   message: 'Another link has been sent to your email',
            //   backgroundColor: Theme.of(context).colorScheme.primary,
            // );
          },
          padding: const EdgeInsets.symmetric(vertical: 13.0),
          fontSize: 18,
          text: 'Resend',
        ),
      ],
    );
  }
}
