import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/controllers/bottom_nav_bar_controller.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/auth/welcome_screen.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/accounts_list_widget.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/balance_card_widget.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/settings_icon_widget.dart';
import 'package:job_studio_profile_ui/views/profile/settings/languages_list_widget.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/bottom_sheet_widget.dart';
import 'package:job_studio_profile_ui/widgets/button_widget.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/snack_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: 'Profile Settings'),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            GoPremiumButtonWidget(),
            Gap(20.0),
            BalanceCardWidget(),
            Gap(20.0),
            ManageAccountButtonsWidget(),
            Gap(20.0),
            AccountButtonsWidget(),
            Gap(20.0),
            ActivitiesButtonsWidget(),
            Gap(20.0),
            AppButtonsWidget(),
            Gap(80.0),
            LogoutButton(),
            Gap(20.0),
          ],
        ),
      ),
    );
  }
}

class GoPremiumButtonWidget extends StatelessWidget {
  const GoPremiumButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.logoBlack.withOpacity(.05),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              name: SvgIcons.crown,
              width: 22,
              height: 22,
            ),
            Gap(10.0),
            TextWidget(
              'Become a',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.systemGray,
            ),
            Gap(3.0),
            TextWidget(
              'Premium',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.systemGray,
            ),
            Gap(3.0),
            TextWidget(
              'member',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.systemGray,
            ),
          ],
        ),
      ),
    );
  }
}

class ManageAccountButtonsWidget extends StatelessWidget {
  const ManageAccountButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextWidget(
            'MANAGE ACCOUNT',
            color: AppColors.systemGray03Light,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10.0),
        TileButtonWidget(
          onTap: () async {
            await bottomSheetWidget(
              const AccountsListWidget(),
            );
          },
          leading: const SettingsIconWidget(icon: SvgIcons.switch_icon),
          title: 'Switch Account',
          defaultTrailing: true,
        ),
      ],
    );
  }
}

class AccountButtonsWidget extends StatelessWidget {
  const AccountButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextWidget(
            'ACCOUNT',
            color: AppColors.systemGray03Light,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10.0),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.pencil),
          title: 'Edit Profile',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.first,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.security),
          title: 'Security',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.arrows),
          title: 'CV Builder',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.withdraw),
          title: 'Withdraw',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () async {
            await Clipboard.setData(const ClipboardData(text: 'User ID'));
            snackBarWidget(
              title: 'Copied',
              message: 'User ID copied to clipboard',
              messageHeight: 0.8,
              backgroundColor: Theme.of(context).colorScheme.primary,
            );
          },
          leading: const SettingsIconWidget(
            icon: SvgIcons.document,
            backgroundColor: AppColors.systemGray,
          ),
          title: 'Copy User ID',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.last,
        ),
      ],
    );
  }
}

class ActivitiesButtonsWidget extends StatelessWidget {
  const ActivitiesButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextWidget(
            'ACTIVITIES',
            color: AppColors.systemGray03Light,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10.0),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.my_activities),
          title: 'My Activities',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.first,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.kpi),
          title: 'KPI',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.last,
        ),
      ],
    );
  }
}

class AppButtonsWidget extends StatelessWidget {
  const AppButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextWidget(
            'APP',
            color: AppColors.systemGray03Light,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(10.0),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.login_qr_code),
          title: 'Login via QR code',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.first,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.company_selected),
          title: 'Become a company',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () async {
            await bottomSheetWidget(
              const LanguagesListWidget(),
              backgroundColor: Theme.of(context).colorScheme.background,
            );
          },
          leading: const SettingsIconWidget(icon: SvgIcons.language),
          title: 'Language',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.legal_center),
          title: 'Legal Center',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.report_and_ticket),
          title: 'Report and Ticket',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.help_center),
          title: 'Help Center',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.middle,
          dividerIndent: 64,
        ),
        TileButtonWidget(
          onTap: () {},
          leading: const SettingsIconWidget(icon: SvgIcons.support),
          title: 'Support',
          defaultTrailing: true,
          tileButtonPosition: TileButtonPosition.last,
        ),
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () async {
        await bottomSheetWidget(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButtonWidget(
                      onPressed: () {
                        Get.back();
                      },
                      backgroundColor: Theme.of(context).colorScheme.background,
                      iconColor: AppColors.systemGray,
                      icon: SvgIcons.close,
                      iconHeight: 24,
                      iconWidth: 24,
                    )
                  ],
                ),
                const TextWidget(
                  '👋🏻',
                  fontSize: 100,
                ),
                const TextWidget(
                  'Good Bye',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                const Gap(24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: ButtonWidget(
                    onPressed: () {
                      Get.back();
                      BottomNavBarController.to.clearIndex();
                      Get.offAllNamed(WelcomeScreen.routeName);
                    },
                    color: AppColors.systemRed.withOpacity(0.06),
                    textColor: AppColors.systemRed,
                    splashColor: AppColors.systemGray02Light.withOpacity(0.1),
                    text: 'Log Out',
                  ),
                ),
                const Gap(40.0),
              ],
            ),
          ),
        );
      },
      color: Colors.white,
      splashColor: AppColors.systemGray.withOpacity(0.1),
      textColor: AppColors.systemRed,
      text: 'Log Out',
    );
  }
}
