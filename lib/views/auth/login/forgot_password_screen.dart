import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/login/reset_password_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:validators/validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = '/forgot-password';
  const ForgotPasswordScreen({super.key});

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
                    ForgotPasswordWidget(),
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

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late TextEditingController emailController;

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            'Forgot Password',
            fontSize: 32,
            fontWeight: FontWeight.w600,
            // color: AppColors.systemGray,
          ),
          const TextWidget(
            'Please enter your Email Address to continue',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.systemGray03Light,
          ),
          const Gap(24.0),
          Form(
            key: formKey,
            child: Column(
              children: [
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
              ],
            ),
          ),
          const Gap(32.0),
          ButtonWidget(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Get.toNamed(ResetPasswordScreen.routeName);
                // Get.offAllNamed(BottomNavBarScreen.routeName);
              }
            },
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            fontSize: 18,
            text: 'Continue',
          ),
          const Gap(32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                'Go back to',
                fontWeight: FontWeight.w600,
                color: AppColors.systemGray02Light,
              ),
              const Gap(4.0),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const TextWidget(
                  'Login Page',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.logoGreen,
                ),
              ),
            ],
          ),
          const Gap(112.0),
        ],
      ),
    );
  }
}
