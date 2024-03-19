import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/icon_button_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: const [0.1, 1],
              transform: const GradientRotation(0.8),
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ]),
        ),
        child: InkWell(
          onTap: () {
            // TODO Balance Screen
          },
          splashColor: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: [
              Positioned(
                top: -200,
                left: -150,
                child: Container(
                  width: 450,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.1),
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(450, 400)),
                  ),
                ),
              ),
              Positioned(
                top: -150,
                left: -110,
                child: ClipOval(
                  child: Container(
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.1),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(350, 300)),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -100,
                left: -50,
                child: ClipOval(
                  child: Container(
                    width: 225,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.elliptical(225, 200),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          stops: const [0.2, 0.4],
                          transform: const GradientRotation(0.7),
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0),
                          ]),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20.0),
                    const SvgIcon(name: SvgIcons.logo_white),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AllowNegativePadding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: -8.0),
                              child: TextWidget(
                                'Card Balance',
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextWidget(
                              '\$650,000',
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButtonWidget(
                          onPressed: () {},
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.4),
                          overlayColor: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.2),
                          icon: SvgIcons.creditcard_details,
                        )
                      ],
                    ),
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
