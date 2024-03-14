import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/phone_number_code_verification_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/phone_number_text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class LoginByPhoneNumberScreen extends StatelessWidget {
  static const String routeName = '/login-by-phone-number';
  const LoginByPhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
      ),
      body: Container(
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
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              left: -100,
              top: -400,
              child: SvgIcon(
                name: SvgIcons.C,
                // color: Colors.black,
                width: MediaQuery.of(context).size.width * 1.5,
                height: MediaQuery.of(context).size.width * 1.5,
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SvgIcon(
                      name: SvgIcons.logo,
                      width: 32,
                      height: 32,
                    ),
                    LoginByPhoneNumberWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginByPhoneNumberWidget extends StatefulWidget {
  const LoginByPhoneNumberWidget({
    super.key,
  });

  @override
  State<LoginByPhoneNumberWidget> createState() =>
      _LoginByPhoneNumberWidgetState();
}

class _LoginByPhoneNumberWidgetState extends State<LoginByPhoneNumberWidget> {
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

  final formKey = GlobalKey<FormState>();

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
                      'Enter Phone Number',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.systemGray,
                    ),
                    TextWidget(
                      'Please enter your phone number to continue',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.systemGray03Light,
                    ),
                  ],
                ),
                const Gap(24.0),
                Form(
                  key: formKey,
                  child: PhoneNumberTextFieldWidget(
                    controller: controller,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ButtonWidget(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Get.toNamed(PhoneNumberCodeVerificationScreen.routeName);
              }
            },
            text: 'Continue',
          ),
          const Gap(32.0),
        ],
      ),
    );
  }
}
