import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/app_bar_widget.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        widget: const SvgIcon(name: SvgIcons.logo),
        hasBackButton: false,
        centerTitle: false,
        actions: [
          IconButtonWidget(
            onPressed: () {},
            icon: SvgIcons.bell,
            iconWidth: 25,
            iconHeight: 25,
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          const Gap(4.0),
          Badge(
            isLabelVisible: true,
            largeSize: 22,
            smallSize: 22,
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            label: const TextWidget(
              '13',
              fontSize: 13,
              // color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            offset: const Offset(2, 0),
            child: IconButtonWidget(
              onPressed: () {},
              icon: SvgIcons.message,
              iconWidth: 21,
              iconHeight: 21,
              iconColor: Theme.of(context).colorScheme.onPrimary,
              backgroundColor: Colors.green,
              // iconColor: Colors.white,
            ),
          ),
          const Gap(12.0),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              'Home Screen',
              fontSize: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(name: SvgIcons.home_selected),
                SvgIcon(name: SvgIcons.search),
                SvgIcon(name: SvgIcons.post),
                SvgIcon(name: SvgIcons.posts),
                SvgIcon(name: SvgIcons.profile),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
