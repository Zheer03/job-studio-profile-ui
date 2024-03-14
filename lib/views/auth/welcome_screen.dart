import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/login/login_screen.dart';
import 'package:job_studio_profile_ui/views/auth/restore_account/login_options_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/radio_button_card_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        enabled: false,
        backgroundColor: AppColors.transparent,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'Welcome to',
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.systemGray,
              ),
              Gap(4.0),
              SvgIcon(
                name: SvgIcons.logo,
                width: 32,
                height: 32,
              ),
              Gap(48.0),
              LoginMethodCardsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginMethodCardsWidget extends StatefulWidget {
  const LoginMethodCardsWidget({
    super.key,
  });

  @override
  State<LoginMethodCardsWidget> createState() => _LoginMethodCardsWidgetState();
}

class _LoginMethodCardsWidgetState extends State<LoginMethodCardsWidget> {
  AuthenticationMethod defaultLoginMethod = AuthenticationMethod.restoreAccount;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RadioButtonCardWidget(
            onTap: () {
              setState(() {
                defaultLoginMethod = AuthenticationMethod.restoreAccount;
              });
            },
            icon: SvgIcons.restore_account,
            title: AuthenticationMethod.restoreAccount.title,
            text: AuthenticationMethod.restoreAccount.text,
            description: AuthenticationMethod.restoreAccount.description,
            selected: defaultLoginMethod == AuthenticationMethod.restoreAccount,
          ),
          const Gap(16.0),
          RadioButtonCardWidget(
            onTap: () {
              setState(() {
                defaultLoginMethod = AuthenticationMethod.firstLogin;
              });
            },
            icon: SvgIcons.login,
            title: AuthenticationMethod.firstLogin.title,
            text: AuthenticationMethod.firstLogin.text,
            description: AuthenticationMethod.firstLogin.description,
            selected: defaultLoginMethod == AuthenticationMethod.firstLogin,
          ),
          const Spacer(),
          ButtonWidget(
            onPressed: () {
              if (defaultLoginMethod == AuthenticationMethod.restoreAccount) {
                // TODO Restore Account
                Get.toNamed(LoginOptionsScreen.routeName);
              } else {
                // Login Screen
                Get.toNamed(LoginScreen.routeName);
              }
            },
            text: 'Continue',
          ),
        ],
      ),
    );
  }
}

enum AuthenticationMethod {
  restoreAccount(
    title: 'Restore Account',
    text: 'Signed Up on the previous version',
    description:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
    icon: SvgIcons.restore_account,
  ),
  firstLogin(
    title: 'Login',
    text: 'Your first time using Job Studio',
    description:
        'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
    icon: SvgIcons.login,
  );

  final String title;
  final String text;
  final String description;
  final String icon;

  const AuthenticationMethod({
    required this.title,
    required this.text,
    required this.description,
    required this.icon,
  });
}
