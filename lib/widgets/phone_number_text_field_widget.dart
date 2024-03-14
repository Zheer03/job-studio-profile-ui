import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/country_code.dart';
import 'package:job_studio_profile_ui/widgets/allow_negative_padding.dart';
import 'package:job_studio_profile_ui/widgets/bottom_sheet_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_field_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';
import 'package:remixicon_updated/remixicon_updated.dart';

class PhoneNumberTextFieldWidget extends StatefulWidget {
  const PhoneNumberTextFieldWidget({
    super.key,
    required this.controller,
    this.error = false,
  });
  final TextEditingController controller;
  final bool error;

  @override
  State<PhoneNumberTextFieldWidget> createState() =>
      _PhoneNumberTextFieldWidgetState();
}

class _PhoneNumberTextFieldWidgetState
    extends State<PhoneNumberTextFieldWidget> {
  late CountryCodeModel defaultCountry;

  @override
  void initState() {
    defaultCountry = CountryCodeHelper.defaultCountryCode();
    PhoneInputFormatter.replacePhoneMask(
        countryCode: defaultCountry.code, newMask: '+000 000 000 0000');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () async {
            bottomSheetWidget(
              Flexible(
                child: CountryPickerWidget(
                  onCountryCodeSelected: (countryCodeModel) {
                    defaultCountry = countryCodeModel;
                    setState(() {});
                  },
                ),
              ),
              backgroundColor: Colors.white,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
            );
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.systemGray02Light),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    defaultCountry.flag,
                    fontSize: 24,
                  ),
                  // const Gap(10.0),
                  const AllowNegativePadding(
                    padding: EdgeInsets.symmetric(vertical: -6.0),
                  ),
                  const Gap(4.0),
                  TextWidget(
                    defaultCountry.dialCode,
                    fontSize: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap(10.0),
        Expanded(
          child: AnimatedTextFormField(
            hintText: 'Phone Number',
            controller: widget.controller,
            error: widget.error,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter your phone number';
              } else if (value.length < 12) {
                return 'You number should be 10 digits';
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.phone,
            inputFormatters: [
              PhoneInputFormatter(
                allowEndlessPhone: false,
                defaultCountryCode: defaultCountry.code,
              ),
            ],
            // decoration: InputDecoration(
            //   contentPadding:
            //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            //   errorMaxLines: 2,
            //   enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: const BorderSide(
            //       color: AppColors.systemGray02Light,
            //       width: 1,
            //     ),
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: const BorderSide(
            //       color: AppColors.logoGreen,
            //       width: 1,
            //     ),
            //   ),
            //   errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: BorderSide(
            //       color: Colors.red.shade800,
            //       width: 1.5,
            //     ),
            //   ),
            //   focusedErrorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(12.0),
            //     borderSide: BorderSide(
            //       color: Colors.red.shade800,
            //       width: 1.5,
            //     ),
            //   ),
            //   hintText: 'Phone Number',
            // ),
          ),
        ),
      ],
    );
  }
}

class CountryPickerWidget extends StatefulWidget {
  const CountryPickerWidget({
    super.key,
    required this.onCountryCodeSelected,
  });

  final Function(CountryCodeModel countryCodeModel) onCountryCodeSelected;

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  List<CountryCodeModel> countryCodes = CountryCodeHelper.getCountryCodes();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.94,
      minChildSize: 0.5,
      snap: true,
      snapSizes: const [0.5, 0.94],
      builder: (context, scrollController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldWidget(
                hintText: 'Search',
                suffixIcon: Remix.search_line,
                onChanged: (value) {
                  log(value);
                  setState(() {
                    countryCodes =
                        CountryCodeHelper.getCountryCodes(search: value);
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: countryCodes.length,
                itemBuilder: (context, index) {
                  final countryCodeModel = countryCodes[index];
                  return ListTile(
                    leading: TextWidget(
                      countryCodeModel.flag,
                      fontSize: 30,
                    ),
                    title: TextWidget(
                      countryCodeModel.name,
                      fontSize: 18,
                    ),
                    subtitle: TextWidget(
                      countryCodeModel.code,
                      fontSize: 16,
                    ),
                    trailing: TextWidget(
                      countryCodeModel.dialCode,
                      fontSize: 16,
                    ),
                    onTap: () {
                      Get.back();
                      widget.onCountryCodeSelected(countryCodeModel);
                    },
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }
}
