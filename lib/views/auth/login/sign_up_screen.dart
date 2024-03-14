import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/login/login_screen.dart';
import 'package:job_studio_profile_ui/views/auth/login/verify_email_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:validators/validators.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = '/sign-up';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: appBarWidget(
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
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
                      Gap(96.0),
                      SignUpWidget(),
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

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late TextEditingController firsNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    firsNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firsNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            'Sign Up',
            fontSize: 32,
            fontWeight: FontWeight.w600,
            // color: AppColors.systemGray,
          ),
          const TextWidget(
            'Create a Job Studio account',
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
                  controller: firsNameController,
                  hintText: 'First Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your First Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(16.0),
                TextFieldWidget(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Last Name';
                    } else {
                      return null;
                    }
                  },
                ),
                const Gap(16.0),
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
                const Gap(16),
                TextFieldWidget(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter your Password';
                    } else if (value != passwordController.text) {
                      return 'Confrim Password doesn\'t match with Password';
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
              // if (formKey.currentState!.validate()) {
              Get.offAllNamed(VerifyEmailScreen.routeName);
              // }
            },
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            fontSize: 18,
            text: 'SignUp',
          ),
          const Gap(24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget(
                'Already have an acoount?',
                fontWeight: FontWeight.w600,
                color: AppColors.systemGray02Light,
              ),
              const Gap(4.0),
              GestureDetector(
                onTap: () {
                  Get.offNamed(LoginScreen.routeName);
                },
                child: const TextWidget(
                  'SignIn',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.logoGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
