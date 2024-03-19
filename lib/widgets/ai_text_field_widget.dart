import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/utilities/svg_icons.dart';
import 'package:job_studio_profile_ui/views/profile/settings/accounts/settings_icon_widget.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class AITextFieldWidget extends StatefulWidget {
  const AITextFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.keyboardType = TextInputType.multiline,
    this.minLines = 10,
    this.error = false,
    this.onTap,
    this.enabled = true,
    this.canRequestFocus = true,
    this.suffix,
    this.allowExpand = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextInputType keyboardType;
  final int minLines;
  final bool error;
  final VoidCallback? onTap;
  final bool enabled;
  final bool canRequestFocus;
  final Widget? suffix;
  final bool allowExpand;

  @override
  State<AITextFieldWidget> createState() => _AITextFieldWidgetState();
}

class _AITextFieldWidgetState extends State<AITextFieldWidget> {
  FocusNode focusNode = FocusNode();
  bool _isFocused = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        _isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  int currentCharIndex = 0;

  String text =
      'Milestone is a method that will allow the business and the freelancer an opportunity to agree on the actions, services, or the payment that are included in the project. With the use of milestones.';

  Future typeWritingAnimation() async {
    for (currentCharIndex = 0;
        currentCharIndex < text.length;
        currentCharIndex++) {
      if (isGenerating) {
        await Future.delayed(
          const Duration(milliseconds: 20),
          () async {
            log('currentCharIndex: $currentCharIndex');
            widget.controller.text = text.substring(0, currentCharIndex);
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          },
        );
        setState(() {});
      } else {
        return;
      }
    }

    // if (currentCharIndex == text.length) return;
  }

  bool isGenerating = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.short4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: widget.error
              ? _isFocused
                  ? AppColors.systemRed.shade600
                  : AppColors.systemGray02Light
              : _isFocused
                  ? Theme.of(context).colorScheme.primary
                  : AppColors.systemGray02Light,
          width: widget.error
              ? _isFocused
                  ? 1.5
                  : 1.0
              : 1.0,
        ),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  TextSpan text = TextSpan(
                    text: widget.controller.text,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  );

                  TextPainter tp = TextPainter(
                    text: text,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                  );
                  tp.layout(maxWidth: constraints.maxWidth);

                  int lines = (tp.size.height / tp.preferredLineHeight).ceil();
                  int maxLines = 50;

                  return TextFormField(
                    scrollController: scrollController,
                    onTap: widget.onTap,
                    enabled: widget.enabled,
                    canRequestFocus: widget.canRequestFocus,
                    controller: widget.controller,
                    focusNode: focusNode,
                    keyboardType: widget.keyboardType,
                    minLines: widget.minLines,
                    maxLines: widget.allowExpand
                        ? lines < maxLines
                            ? null
                            : maxLines
                        : widget.minLines,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                    cursorHeight: widget.hintText != null ? 17 : null,
                    textAlignVertical: widget.hintText != null
                        ? TextAlignVertical.bottom
                        : null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: _isFocused || (widget.controller.text.isNotEmpty)
                            ? 13.0
                            : 18.0,
                        right: _isFocused || (widget.controller.text.isNotEmpty)
                            ? 13.0
                            : 18.0,
                        top: _isFocused || (widget.controller.text.isNotEmpty)
                            ? 24.0
                            : 24.0,
                        bottom: 8.0,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      // border: OutlineInputBorder(
                      //   // borderSide: BorderSide.none,
                      //   borderRadius: BorderRadius.circular(12.0),
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      //   borderSide: const BorderSide(
                      //     color: AppColors.systemGray02Light,
                      //     width: 1,
                      //   ),
                      // ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      //   borderSide: const BorderSide(
                      //     color: AppColors.logoGreen,
                      //     width: 1,
                      //   ),
                      // ),
                      // errorBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      //   borderSide: BorderSide(
                      //     color: AppColors.systemRed.shade600,
                      //     width: 1.5,
                      //   ),
                      // ),
                      // focusedErrorBorder: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      //   borderSide: BorderSide(
                      //     color: AppColors.systemRed.shade600,
                      //     width: 1.5,
                      //   ),
                      // ),
                      // errorStyle: TextStyle(
                      //   color: AppColors.systemRed.shade600,
                      //   fontWeight: FontWeight.w500,
                      // ),
                    ),
                    validator: widget.validator,
                  );
                },
              ),
              widget.hintText != null
                  ? Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onTap != null) {
                            widget.onTap!();
                          }

                          focusNode.requestFocus();
                        },
                        child: AnimatedContainer(
                          duration: Durations.short4,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            left: _isFocused ||
                                    (widget.controller.text.isNotEmpty)
                                ? 14.0
                                : 18.0,
                            right: _isFocused ||
                                    (widget.controller.text.isNotEmpty)
                                ? 14.0
                                : 18.0,
                            // bottom: _isFocused || (widget.controller.text.isNotEmpty)
                            //     ? 26
                            //     : 16,
                            top: _isFocused ||
                                    (widget.controller.text.isNotEmpty)
                                ? 8.0
                                : 16.0,
                          ),
                          child: AnimatedDefaultTextStyle(
                            duration: Durations.short4,
                            style: TextStyle(
                              fontSize: _isFocused ||
                                      (widget.controller.text.isNotEmpty)
                                  ? 12
                                  : 15,
                              color: widget.error
                                  ? _isFocused
                                      ? AppColors.systemRed.shade600
                                      : AppColors.systemGray
                                  : _isFocused
                                      ? Theme.of(context).colorScheme.primary
                                      : AppColors.systemGray,
                            ),
                            child: TextWidget(widget.hintText!),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              if (widget.suffix != null)
                Positioned(
                  right: 8,
                  top: 6,
                  child: Align(
                    child: widget.suffix,
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: isGenerating
                ? null
                : () async {
                    setState(() {
                      widget.controller.clear();
                      isGenerating = true;
                    });
                    await Future.delayed(Durations.extralong4);
                    await typeWritingAnimation();

                    setState(() {
                      isGenerating = false;
                    });

                    log('$isGenerating');
                  },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.only(top: 12.0, bottom: 14.0),
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(
                  color: AppColors.systemGray05Light,
                  // width: 0.5,
                ),
              )),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SettingsIconWidget(
                      icon: SvgIcons.sparkles,
                      cardSize: 32,
                      shape: BoxShape.circle,
                      loading: isGenerating,
                    ),
                  ),
                  const Gap(8.0),
                  TextWidget(
                    isGenerating ? 'Generating...' : 'Generate with AI',
                    color: AppColors.systemGray05Dark,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  const Spacer(),
                  AnimatedDefaultTextStyle(
                    duration: Durations.short2,
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      color: isGenerating
                          ? AppColors.logoGreen
                          : AppColors.systemGray02Light,
                      letterSpacing: isGenerating ? null : -0.4,
                      fontSize: isGenerating ? 13 : 12,
                      fontWeight: isGenerating ? FontWeight.w600 : null,
                    ),
                    child: isGenerating
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                isGenerating = false;
                              });
                            },
                            child: const TextWidget('Stop generating'),
                          )
                        : const TextWidget(
                            'Click here to generate your description'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
