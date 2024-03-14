import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/check_mark_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:job_studio_profile_ui/widgets/tile_button_widget.dart';

class AccountsListWidget extends StatelessWidget {
  const AccountsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int itemCount = 4;
    int selectedIndex = 0;
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 0),
                shrinkWrap: true,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return TileButtonWidget(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    backgroundColor: AppColors.systemGray05Light,
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        backgroundImage:
                            const AssetImage('assets/img/person_profile.jpg'),
                      ),
                    ),
                    title: 'Zhir Mohammed',
                    titleFontSize: 15,
                    titleFontWeight: FontWeight.w600,
                    subtitle: 'Information Technology',
                    subtitleFontSize: 11,
                    trailing: CheckMarkWidget(
                      selected: index == selectedIndex,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      iconColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    dividerIndent: 16,
                    dividerEndIndent: 16,
                    tileButtonPosition: index == 0
                        ? TileButtonPosition.first
                        : index == itemCount - 1
                            ? TileButtonPosition.last
                            : TileButtonPosition.middle,
                  );
                },
              ),
              const Gap(16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        shape: BoxShape.circle,
                      ),
                      child: SvgIcon(
                        name: SvgIcons.plus,
                        width: 14,
                        height: 14,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Gap(12.0),
                    const TextWidget(
                      'Login another account',
                      color: AppColors.systemGray,
                    ),
                  ],
                ),
              ),
              const Gap(24.0),
            ],
          ),
        );
      },
    );
  }
}
