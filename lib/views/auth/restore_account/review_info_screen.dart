import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:validators/validators.dart';

class ReviewInfoScreen extends StatelessWidget {
  static const String routeName = '/review-info';

  const ReviewInfoScreen({super.key});

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
        child: GestureDetector(
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
                        ReviewInfoWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewInfoWidget extends StatefulWidget {
  const ReviewInfoWidget({
    super.key,
  });

  @override
  State<ReviewInfoWidget> createState() => _ReviewInfoWidgetState();
}

class _ReviewInfoWidgetState extends State<ReviewInfoWidget> {
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

  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(96.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              'Review Info',
              fontSize: 32,
              fontWeight: FontWeight.w600,
              // color: AppColors.systemGray,
            ),
            const TextWidget(
              'Please enter your infromation to continue',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.systemGray03Light,
            ),
            const Gap(24.0),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AnimatedTextFormField(
                    controller: firsNameController,
                    error: error,
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
                  AnimatedTextFormField(
                    controller: lastNameController,
                    error: error,
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
                  AnimatedTextFormField(
                    controller: emailController,
                    error: error,
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
                  AnimatedTextFormField(
                    controller: passwordController,
                    error: error,
                    hintText: 'Password',
                    isPassword: true,
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
                  AnimatedTextFormField(
                    controller: confirmPasswordController,
                    error: error,
                    hintText: 'Confirm Password',
                    isPassword: true,
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
                FocusScope.of(context).unfocus();

                setState(() {
                  error = !formKey.currentState!.validate();
                });
                if (!error) {
                  Get.offAllNamed(BottomNavBarScreen.routeName);
                }
              },
              text: 'Continue',
            ),
          ],
        ),
      ],
    );
  }
}
