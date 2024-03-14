import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.hintColor,
    this.validator,
    this.controller,
    this.suffix,
    this.suffixIcon,
    this.obscurePassword = false,
    this.keyboardType,
    this.prefix,
    this.inputFormatters,
    this.onChanged,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.maxLines = 1,
    this.fillColor,
    this.border = true,
  });

  final String? hintText;
  final Color? hintColor;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final bool obscurePassword;
  final Widget? suffix;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onChanged;
  final EdgeInsetsGeometry contentPadding;
  final int maxLines;
  final Color? fillColor;
  final bool border;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.validator != null) {
      return TextFormField(
        focusNode: focusNode,
        // autovalidateMode: AutovalidateMode.onUserInteraction,

        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        // style: const TextStyle(
        //   color: Colors.black,
        //   fontWeight: FontWeight.w500,
        // ),
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          errorMaxLines: 2,
          contentPadding: widget.contentPadding,
          // prefix: widget.prefix,
          prefixIcon: widget.prefix,
          prefixIconColor: FocusScope.of(context).hasFocus
              ? Theme.of(context).colorScheme.primary
              : AppColors.systemGray,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? const BorderSide(
                    color: AppColors.systemGray02Light,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? const BorderSide(
                    color: AppColors.logoGreen,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? BorderSide(
                    color: Colors.red.shade600,
                    width: 1.5,
                  )
                : BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? BorderSide(
                    color: Colors.red.shade600,
                    width: 1.5,
                  )
                : BorderSide.none,
          ),
          errorStyle: TextStyle(
            color: Colors.red.shade600,
            fontWeight: FontWeight.w500,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor ?? AppColors.systemGray,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: widget.suffix ??
              (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
          suffixIconColor: AppColors.systemGray,
        ),
        obscureText: widget.obscurePassword,
      );
    } else {
      return TextField(
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // prefix: widget.prefix,
          prefixIcon: widget.prefix,
          prefixIconColor: isFocused
              ? Theme.of(context).colorScheme.primary
              : AppColors.systemGray,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? const BorderSide(
                    color: AppColors.systemGray02Light,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: widget.border
                ? const BorderSide(
                    color: AppColors.logoGreen,
                    width: 1,
                  )
                : BorderSide.none,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor ?? AppColors.systemGray,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: widget.suffix ??
              (widget.suffixIcon != null ? Icon(widget.suffixIcon) : null),
          suffixIconColor: AppColors.systemGray,
        ),
        obscureText: widget.obscurePassword,
      );
    }
  }
}

class AnimatedTextFormField extends StatefulWidget {
  const AnimatedTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.error = false,
    this.onTap,
    this.enabled = true,
    this.canRequestFocus = true,
    this.suffix,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool error;
  final VoidCallback? onTap;
  final bool enabled;
  final bool canRequestFocus;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AnimatedTextFormField> createState() => _AnimatedTextFormFieldState();
}

class _AnimatedTextFormFieldState extends State<AnimatedTextFormField> {
  FocusNode focusNode = FocusNode();
  bool _isFocused = false;

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        TextFormField(
          onTap: widget.onTap,
          enabled: widget.enabled,
          canRequestFocus: widget.canRequestFocus,
          controller: widget.controller,
          focusNode: focusNode,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          inputFormatters: widget.inputFormatters,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            height: 1.1,
          ),
          cursorHeight: widget.hintText != null ? 17 : null,
          textAlignVertical:
              widget.hintText != null ? TextAlignVertical.bottom : null,
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
            border: OutlineInputBorder(
              // borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.systemGray02Light,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(
                color: AppColors.logoGreen,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColors.systemRed.shade600,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColors.systemRed.shade600,
                width: 1.5,
              ),
            ),
            errorStyle: TextStyle(
              color: AppColors.systemRed.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: widget.validator,
        ),
        widget.hintText != null
            ? GestureDetector(
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
                    left: _isFocused || (widget.controller.text.isNotEmpty)
                        ? 14.0
                        : 18.0,
                    right: _isFocused || (widget.controller.text.isNotEmpty)
                        ? 14.0
                        : 18.0,
                    // bottom: _isFocused || (widget.controller.text.isNotEmpty)
                    //     ? 26
                    //     : 16,
                    top: _isFocused || (widget.controller.text.isNotEmpty)
                        ? 8.0
                        : 16.0,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: Durations.short4,
                    style: TextStyle(
                      fontSize:
                          _isFocused || (widget.controller.text.isNotEmpty)
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
              )
            : const SizedBox(),
        if (widget.suffix != null)
          Positioned(
            right: 8,
            top: 6,
            child: Align(
              child: widget.suffix,
            ),
          )
      ],
    );
  }
}
