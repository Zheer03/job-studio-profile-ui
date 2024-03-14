import 'package:get/get.dart';
import 'package:job_studio_profile_ui/views/profile/profile_screen.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find(tag: 'profile');

  int infoTabIndex = 0;
  List<SelectedChip> chips = SelectedChip.values;

  void updateInfoTabIndex(int index) {
    infoTabIndex = index;
    update();
  }
}
