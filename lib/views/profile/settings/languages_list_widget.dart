import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/check_mark_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

enum Languages { ku, en, ar }

class LanguagesListWidget extends StatelessWidget {
  const LanguagesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Languages languages = Languages.en;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                'Language',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const TextWidget(
                'Change your app language',
                color: AppColors.systemGray,
              ),
              const Gap(24.0),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.logoBlack.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]),
                child: Column(
                  children: [
                    TileButtonWidget(
                      onTap: () {
                        setState(() {
                          languages = Languages.ku;
                        });
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      title: 'کوردی',
                      titleFontSize: 16,
                      trailing: CheckMarkWidget(
                        selected: languages == Languages.ku,
                        iconSize: 18,
                      ),
                      dividerIndent: 22,
                      dividerEndIndent: 16,
                      tileButtonPosition: TileButtonPosition.first,
                    ),
                    TileButtonWidget(
                      onTap: () {
                        setState(() {
                          languages = Languages.en;
                        });
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      title: 'English',
                      titleFontSize: 16,
                      trailing: CheckMarkWidget(
                        selected: languages == Languages.en,
                        iconSize: 18,
                      ),
                      dividerIndent: 22,
                      dividerEndIndent: 16,
                      tileButtonPosition: TileButtonPosition.middle,
                    ),
                    TileButtonWidget(
                      onTap: () {
                        setState(() {
                          languages = Languages.ar;
                        });
                      },
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      title: 'العربیة',
                      titleFontSize: 16,
                      trailing: CheckMarkWidget(
                        selected: languages == Languages.ar,
                        iconSize: 18,
                      ),
                      tileButtonPosition: TileButtonPosition.last,
                    ),
                  ],
                ),
              ),
              const Gap(32.0),
            ],
          ),
        );
      },
    );
  }
}
