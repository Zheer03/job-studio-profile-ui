import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_studio_profile_ui/getx/controllers/bottom_nav_bar_controller.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class BottomNavBarScreen extends StatelessWidget {
  static const String routeName = '/dashboard';
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: BottomNavBarController.to,
        builder: (controller) {
          return Scaffold(
            body: IndexedStack(
              index: controller.tabIndex,
              children: controller.pages,
            ),
            bottomNavigationBar: BottomNavBarWidget(controller: controller),
          );
        });
  }
}

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.controller,
  });

  final BottomNavBarController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            blurRadius: 2,
          ),
        ],
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GNav(
          onTabChange: (index) {
            controller.updateIndex(index);
          },
          selectedIndex: controller.tabIndex,
          // backgroundColor: Colors.amber,
          backgroundColor: Theme.of(context).colorScheme.background,
          // curve: Curves.linear,
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 46.0, top: 20.0),
          // iconSize: 26,
          // color: Colors.black,
          // activeColor: Colors.green,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontWeight: FontWeight.w600,
          ),
          gap: 10,
          tabs: [
            GButton(
              active: controller.tabIndex == 0,
              leading: Container(
                color: Theme.of(context).colorScheme.background,
                child: controller.tabIndex == 0
                    ? const SvgIcon(
                        name: SvgIcons.home_selected,
                        height: 24,
                        width: 24,
                      )
                    : const SvgIcon(
                        name: SvgIcons.home,
                        height: 24,
                        width: 24,
                      ),
              ),
              icon: Remix.home_line,
              text: 'Home',
            ),
            GButton(
              active: controller.tabIndex == 1,
              leading: Container(
                color: Theme.of(context).colorScheme.background,
                child: controller.tabIndex == 1
                    ? const SvgIcon(
                        name: SvgIcons.search_selected,
                        height: 24,
                        width: 24,
                      )
                    : const SvgIcon(
                        name: SvgIcons.search,
                        height: 24,
                        width: 24,
                      ),
              ),
              icon: Remix.home_line,
              text: 'Search',
            ),
            GButton(
              active: controller.tabIndex == 2,
              leading: Container(
                color: Theme.of(context).colorScheme.background,
                child: controller.tabIndex == 2
                    ? const SvgIcon(
                        name: SvgIcons.post_selected,
                        height: 24,
                        width: 24,
                      )
                    : const SvgIcon(
                        name: SvgIcons.post,
                        height: 24,
                        width: 24,
                      ),
              ),
              icon: Remix.home_line,
              text: 'Post',
            ),
            GButton(
              active: controller.tabIndex == 3,
              leading: Container(
                color: Theme.of(context).colorScheme.background,
                child: controller.tabIndex == 3
                    ? const SvgIcon(
                        name: SvgIcons.posts_selected,
                        height: 24,
                        width: 24,
                      )
                    : const SvgIcon(
                        name: SvgIcons.posts,
                        height: 24,
                        width: 24,
                      ),
              ),
              icon: Remix.home_line,
              text: 'Posts',
            ),
            GButton(
              active: controller.tabIndex == 4,
              leading: Container(
                color: Theme.of(context).colorScheme.background,
                child: controller.tabIndex == 4
                    ? const SvgIcon(
                        name: SvgIcons.profile_selected,
                        height: 24,
                        width: 24,
                      )
                    : const SvgIcon(
                        name: SvgIcons.profile,
                        height: 24,
                        width: 24,
                      ),
              ),
              icon: Remix.home_line,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
