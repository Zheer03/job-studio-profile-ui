import 'package:flutter/material.dart';
import 'package:job_studio_profile_ui/theme/app_theme.dart';
import 'package:job_studio_profile_ui/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.splashColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.child,
    this.enabled = true,
    this.width,
    this.shadow = false,
    this.padding = const EdgeInsets.symmetric(vertical: 13.0),
  });

  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? splashColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final bool enabled;
  final double? width;
  final bool shadow;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                    color: AppColors.logoBlack.withOpacity(.1),
                    blurRadius: 20,
                    offset: const Offset(0, 8)
                    // blurStyle: BlurStyle.solid,
                    ),
              ],
            )
          : null,
      child: MaterialButton(
        onPressed: enabled ? onPressed : null,
        padding: padding,
        color: color ?? Theme.of(context).colorScheme.primary,
        splashColor:
            splashColor ?? AppColors.systemGray06Light.withOpacity(0.1),
        elevation: 0,
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        highlightElevation: 0,
        minWidth: width ?? double.infinity,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        disabledColor: color ?? AppColors.systemGray,
        disabledElevation: 0,
        disabledTextColor: AppColors.systemGray05Dark,
        child: child ??
            TextWidget(
              text,
              color: textColor ?? AppColors.systemWhite,
              fontSize: fontSize ?? 19,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
      ),
    );
  }
}
