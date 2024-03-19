import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/review_info_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PhoneNumberCodeVerificationScreen extends StatelessWidget {
  static const String routeName = '/phone-number-code-verification';

  const PhoneNumberCodeVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.amber,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              transform: const GradientRotation(0.4),
              stops: const [0.7, 1],
              colors: [
                // const Color(0xFFF9F9F9).withOpacity(1),
                // AppColors.systemWhite,
                AppColors.logoGreen.withAlpha(0),
                AppColors.logoGreen.withAlpha(40),
              ],
            ),
          ),
          child: const Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                left: -100,
                top: -400,
                child: SvgIcon(
                  name: SvgIcons.C,
                  // color: Colors.black,
                  width: 645.0,
                  height: 645.0,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SvgIcon(
                        name: SvgIcons.logo,
                        width: 32,
                        height: 32,
                      ),
                      PhoneNumberCodeVerificationWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberCodeVerificationWidget extends StatefulWidget {
  const PhoneNumberCodeVerificationWidget({
    super.key,
  });

  @override
  State<PhoneNumberCodeVerificationWidget> createState() =>
      _PhoneNumberCodeVerificationWidgetState();
}

class _PhoneNumberCodeVerificationWidgetState
    extends State<PhoneNumberCodeVerificationWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(64.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Confirm Phone Number',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.systemGray,
                    ),
                    TextWidget(
                      'Enter the 6-digit login code to your number ending in 7300 finish setting up two-factor authentication',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.systemGray03Light,
                    ),
                  ],
                ),
                const Gap(24.0),
                PinCodeTextField(
                  controller: controller,
                  // autovalidateMode: AutovalidateMode.disabled,
                  autoDisposeControllers: false,
                  appContext: context,
                  inputFormatters: [
                    MaskedInputFormatter('000000'),
                  ],
                  length: 6,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeFillColor: AppColors.transparent,
                    activeColor: AppColors.systemGray03Light,
                    activeBorderWidth: 1,
                    inactiveFillColor: AppColors.transparent,
                    inactiveColor: AppColors.systemGray03Light,
                    inactiveBorderWidth: 1,
                    selectedFillColor: AppColors.logoGreen,
                    selectedColor: AppColors.logoGreen,
                    selectedBorderWidth: 1,
                  ),
                  enableActiveFill: true,
                  cursorColor: AppColors.systemWhite,
                  animationDuration: const Duration(milliseconds: 300),
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                snackBarWidget(
                  title: 'SMS Code',
                  message: 'Code Successfully resent to your phone number',
                );
              },
              child: TextWidget(
                'Resend Code?',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const Gap(8.0),
          ButtonWidget(
              onPressed: () {
                if (controller.text.length >= 6) {
                  log('message: ${controller.text}');

                  Get.toNamed(ReviewInfoScreen.routeName);
                } else {
                  log('message: ${controller.text}');
                  snackBarWidget(
                      title: 'Invalid Code',
                      message: 'Please enter the code in the correct format',
                      backgroundColor: AppColors.systemRed.shade600);
                }
              },
              text: 'Continue'),
          const Gap(32.0),
        ],
      ),
    );
  }
}
