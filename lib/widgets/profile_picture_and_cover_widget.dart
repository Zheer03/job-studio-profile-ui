import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/full_screen_widget.dart';

class ProfilePictureAndCoverWidget extends StatelessWidget {
  const ProfilePictureAndCoverWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AllowNegativePadding(
      padding: const EdgeInsets.only(left: -16.0, right: -16.0, bottom: 0.0),
      child: Stack(
        // alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height * 0.27,
            child: Container(
              color: AppColors.systemGray03Light,
              height: MediaQuery.of(context).size.height * 0.20,
              child: ClipRect(
                child: Material(
                  child: Ink.image(
                    fit: BoxFit.cover,
                    image: const AssetImage('assets/img/person_cover.png'),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          FullScreenPage.routeName,
                          arguments: const FullScreenPage(
                            child: Image(
                              image: AssetImage('assets/img/person_cover.png'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Theme.of(context).colorScheme.background,
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: CircleAvatar(
                      radius: 53,
                      backgroundColor: AppColors.transparent,
                      child: Ink.image(
                        image:
                            const AssetImage('assets/img/person_profile.jpg'),
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(
                              FullScreenPage.routeName,
                              arguments: const FullScreenPage(
                                child: Image(
                                  image: AssetImage(
                                      'assets/img/person_profile.jpg'),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
