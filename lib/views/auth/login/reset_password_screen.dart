import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String routeName = '/reset-password';

  const ResetPasswordScreen({super.key});

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Reset Password',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.systemGray,
                    ),
                    Gap(8.0),
                    TextWidget(
                      'We\'ve sent a reset link to your email',
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      // fontWeight: FontWeight.w600,
                      color: AppColors.systemGray03Light,
                    ),
                    TextWidget(
                      '(hhish4m@gmail.com)',
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w600,
                      color: AppColors.logoGreen,
                    ),
                    TextWidget(
                      'Please check your mail and reset your password with the link in an hour before the link expire.',
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      // fontWeight: FontWeight.w600,
                      color: AppColors.systemGray03Light,
                    ),
                    Gap(40.0),
                  ],
                ),
              ),
              ButtonWidget(
                onPressed: () {
                  Get.back();
                  Get.back();
                },
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                fontSize: 18,
                text: 'Continue',
              ),
              const Gap(16.0),
              GestureDetector(
                onTap: () {
                  snackBarWidget(
                    title: 'Reset Password',
                    message: 'Another link has been sent to your email',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  );
                },
                child: const TextWidget(
                  'Resend Link?',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.logoGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
