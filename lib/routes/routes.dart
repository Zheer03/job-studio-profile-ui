import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/views/auth/login/forgot_password_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/login_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/reset_password_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/sign_up_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/verify_email_screen.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/login_by_phone_number_screen.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/login_options_screen.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/phone_number_code_verification_screen.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/review_info_screen.dart';
import 'package:job_studio_profile_ui/views/auth/welcome_screen.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:job_studio_profile_ui/views/profile/choose_categories_screen.dart';
import 'package:job_studio_profile_ui/views/profile/job_categories_screen.dart';
import 'package:job_studio_profile_ui/views/profile/locations_screen.dart';
import 'package:job_studio_profile_ui/views/profile/settings/settings_screen.dart';
import 'package:job_studio_profile_ui/views/profile/setup_profile_screen.dart';
import 'package:job_studio_profile_ui/widgets/full_screen_widget.dart';

class RoutesClass {
  static List<GetPage> routes = [
    GetPage(
      name: WelcomeScreen.routeName,
      page: () => const WelcomeScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: LoginOptionsScreen.routeName,
      page: () => const LoginOptionsScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: LoginByPhoneNumberScreen.routeName,
      page: () => const LoginByPhoneNumberScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: PhoneNumberCodeVerificationScreen.routeName,
      page: () => const PhoneNumberCodeVerificationScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ReviewInfoScreen.routeName,
      page: () => const ReviewInfoScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: SignUpScreen.routeName,
      page: () => const SignUpScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ForgotPasswordScreen.routeName,
      page: () => const ForgotPasswordScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ResetPasswordScreen.routeName,
      page: () => const ResetPasswordScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: VerifyEmailScreen.routeName,
      page: () => const VerifyEmailScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: SetupProfileScreen.routeName,
      page: () => const SetupProfileScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: LocationsScreen.routeName,
      page: () => const LocationsScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: JobCategoriesScreen.routeName,
      page: () => const JobCategoriesScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: ChooseCategoriesScreen.routeName,
      page: () => const ChooseCategoriesScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: BottomNavBarScreen.routeName,
      page: () => const BottomNavBarScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: SettingsScreen.routeName,
      page: () => const SettingsScreen(),
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: FullScreenPage.routeName,
      page: () {
        FullScreenPage fullScreen = Get.arguments;
        return fullScreen;
      },
      customTransition: CustomFadeTransition(),
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

class CustomFadeTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
