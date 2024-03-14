import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/login/forgot_password_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/sign_up_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/verify_email_screen.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

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
                    LoginWidget(),
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

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(64.0),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    'Login',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    // color: AppColors.systemGray,
                  ),
                  const TextWidget(
                    'Login to your Job Studio account',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.systemGray03Light,
                  ),
                  const Gap(24.0),
                  TextFieldWidget(
                    controller: emailController,
                    hintText: 'Email Address',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Email';
                      } else if (!isEmail(value)) {
                        return 'Email should be written in the correct format';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap(16.0),
                  TextFieldWidget(
                    controller: passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your Password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters in length';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ForgotPasswordScreen.routeName);
                        },
                        child: const TextWidget(
                          'Forgot Password?',
                          fontWeight: FontWeight.w600,
                          color: AppColors.systemGray02Light,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Gap(112.0),
            Row(
              children: [
                Flexible(
                  flex: 200,
                  child: ButtonWidget(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        log('true');
                        Get.offAllNamed(BottomNavBarScreen.routeName);
                      } else {
                        log('FALSE');
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    fontSize: 18,
                    text: 'Login',
                  ),
                ),
                const Gap(16.0),
                Flexible(
                  flex: 32,
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                          color: AppColors.systemGray03Light,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ButtonWidget(
                        onPressed: () {},
                        text: '',
                        color: AppColors.transparent,
                        // splashColor: Theme.of(context).colorScheme.primary,
                        // .withOpacity(0.4),
                        child: SvgIcon(
                          name: SvgIcons.login_qr_code,
                          width: 24,
                          height: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(24.0),
            const Center(
              child: TextWidget(
                'Or',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.systemGray02Light,
              ),
            ),
            const Gap(24.0),
            if (Platform.isAndroid)
              ButtonWidget(
                onPressed: () {
                  // TODO Google SignIn
                },
                shadow: true,
                color: AppColors.systemWhite,
                textColor: AppColors.systemGray05Dark,
                text: '',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(
                      name: SvgIcons.google,
                      width: 22,
                      height: 22,
                    ),
                    Gap(8.0),
                    TextWidget(
                      'Continue with Google',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.systemGray05Dark,
                    ),
                  ],
                ),
              )
            else
              ButtonWidget(
                onPressed: () {
                  // TODO Apple SignIn
                  Get.toNamed(VerifyEmailScreen.routeName);
                },
                color: AppColors.logoBlack,
                text: '',
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(
                      name: SvgIcons.apple,
                      width: 22,
                      height: 22,
                      color: AppColors.systemWhite,
                    ),
                    Gap(8.0),
                    TextWidget(
                      'Continue with Apple',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.systemWhite,
                    ),
                  ],
                ),
              ),
            const Gap(16.0),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget(
                  'Don\'t have an acoount?',
                  fontWeight: FontWeight.w600,
                  color: AppColors.systemGray02Light,
                ),
                const Gap(4.0),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(SignUpScreen.routeName);
                  },
                  child: const TextWidget(
                    'SignUp',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.logoGreen,
                  ),
                ),
              ],
            ),
            const Gap(32.0),
          ],
        ),
      ),
    );
  }
}
