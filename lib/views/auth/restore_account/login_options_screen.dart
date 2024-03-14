import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/login_by_phone_number_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/radio_button_card_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class LoginOptionsScreen extends StatelessWidget {
  static const String routeName = '/login-options';
  const LoginOptionsScreen({super.key});

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
                    LoginOptionsWidget(),
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

class LoginOptionsWidget extends StatefulWidget {
  const LoginOptionsWidget({
    super.key,
  });

  @override
  State<LoginOptionsWidget> createState() => _LoginOptionsWidgetState();
}

class _LoginOptionsWidgetState extends State<LoginOptionsWidget> {
  LoginOption defaultLoginOption =
      Platform.isAndroid ? LoginOption.google : LoginOption.apple;

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
                      'Choose Login Method',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      // color: AppColors.systemGray,
                    ),
                    TextWidget(
                      'Please choose your preffered login method',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.systemGray03Light,
                    ),
                  ],
                ),
                const Gap(24.0),
                Column(
                  children: [
                    if (Platform.isAndroid)
                      RadioButtonCardWidget(
                        onTap: () {
                          setState(() {
                            defaultLoginOption = LoginOption.google;
                          });
                        },
                        selected: defaultLoginOption == LoginOption.google,
                        iconBackgroundColor: AppColors.systemGray06Light,
                        svgIcon: SvgIcon(
                          name: LoginOption.google.icon,
                        ),
                        icon: LoginOption.google.icon,
                        borderWidth: 1.5,
                        title: LoginOption.google.name,
                      )
                    else
                      RadioButtonCardWidget(
                        onTap: () {
                          setState(() {
                            defaultLoginOption = LoginOption.apple;
                          });
                        },
                        selected: defaultLoginOption == LoginOption.apple,
                        iconBackgroundColor: AppColors.systemGray06Light,
                        svgIcon: SvgIcon(
                          name: LoginOption.apple.icon,
                        ),
                        icon: LoginOption.apple.icon,
                        borderWidth: 1.5,
                        title: LoginOption.apple.name,
                      ),
                    const Gap(16.0),
                    RadioButtonCardWidget(
                      onTap: () {
                        setState(() {
                          defaultLoginOption = LoginOption.phoneNumber;
                        });
                      },
                      selected: defaultLoginOption == LoginOption.phoneNumber,
                      icon: LoginOption.phoneNumber.icon,
                      iconColor: AppColors.systemGray05Dark,
                      iconBackgroundColor: AppColors.systemGray06Light,
                      borderWidth: 1.5,
                      title: LoginOption.phoneNumber.name,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          ButtonWidget(
              onPressed: () {
                switch (defaultLoginOption) {
                  case LoginOption.google:
                    // Google
                    // TODO: Handle this case.
                    break;
                  case LoginOption.apple:
                    // TODO: Handle this case.
                    break;
                  case LoginOption.phoneNumber:
                    // Phone Number
                    Get.toNamed(LoginByPhoneNumberScreen.routeName);
                    break;
                }
              },
              text: 'Continue'),
          const Gap(32.0),
        ],
      ),
    );
  }
}

enum LoginOption {
  google(name: 'Google', icon: SvgIcons.google),
  apple(name: 'Apple', icon: SvgIcons.apple),
  phoneNumber(name: 'Phone Number', icon: SvgIcons.phone);

  final String name;
  final String icon;

  const LoginOption({
    required this.name,
    required this.icon,
  });
}
