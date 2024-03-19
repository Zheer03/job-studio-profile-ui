import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class PortfolioCardWidget extends StatelessWidget {
  const PortfolioCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: AppColors.systemGray04Light,
      borderRadius: BorderRadius.circular(12.0),
      child: Ink.image(
        image: const AssetImage('assets/img/portfolio1.png'),
        fit: BoxFit.cover,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.logoBlack.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                      ),
                    ),
                    // TODO PopUpMenuButton
                  ),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Graphic Design',
                      color: AppColors.systemWhite,
                    ),
                    // Gap(2.0),
                    TextWidget(
                      'Obera Social Media Post',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                      color: AppColors.systemWhite,
                    ),
                    Gap(8.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
