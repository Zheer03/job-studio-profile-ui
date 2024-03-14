import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/views/home/home_screen.dart';
import 'package:job_studio_profile_ui/views/post/post_screen.dart';
import 'package:job_studio_profile_ui/views/posts/posts_screen.dart';
import 'package:job_studio_profile_ui/views/profile/profile_screen.dart';
import 'package:job_studio_profile_ui/views/search/search_screen.dart';

class BottomNavBarController extends GetxController {
  static BottomNavBarController get to => Get.find(tag: 'dashboard');
  var tabIndex = 0;

  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const PostsScreen(),
    const ProfileScreen(),
  ];

  void updateIndex(int index) {
    tabIndex = index;
    update();
  }

  void clearIndex() {
    tabIndex = 0;
    update();
  }
}
