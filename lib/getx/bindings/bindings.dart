import 'package:get/get.dart';
import 'package:job_studio_profile_ui/getx/controllers/bottom_nav_bar_controller.dart';
import 'package:job_studio_profile_ui/getx/controllers/profile_controller.dart';

class BindingManager extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavBarController(), tag: 'dashboard', permanent: true);
    Get.put(ProfileController(), tag: 'profile', permanent: true);
  }
}
