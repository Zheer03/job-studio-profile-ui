import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/controllers/user_controller.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/welcome_screen.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (UserController.to.user != null) {
          Get.offNamed(BottomNavBarScreen.routeName);
        } else {
          Get.offNamed(WelcomeScreen.routeName);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.logoBlack.withOpacity(.05),
              offset: const Offset(0, 6),
              blurRadius: 20,
            )
          ]),
          child: const SvgIcon(
            name: SvgIcons.logo,
            width: 32,
            height: 32,
          ),
        ),
      ),
    );
  }
}
