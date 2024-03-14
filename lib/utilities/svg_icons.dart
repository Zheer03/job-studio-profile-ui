// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;

  const SvgIcon({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      name,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
      fit: fit ?? BoxFit.contain,
    );
  }
}

class SvgIcons {
  static const String arrow_back = 'assets/icons/arrow_back.svg';
  static const String arrow_forward = 'assets/icons/arrow_forward.svg';
  static const String arrows = 'assets/icons/arrows.svg';
  static const String bell = 'assets/icons/bell.svg';
  static const String bookmark_filled = 'assets/icons/bookmark_filled.svg';
  static const String bookmark = 'assets/icons/bookmark.svg';
  static const String check = 'assets/icons/check.svg';
  static const String checkmark = 'assets/icons/checkmark.svg';
  static const String close = 'assets/icons/close.svg';
  static const String company_selected = 'assets/icons/company_selected.svg';
  static const String company = 'assets/icons/company.svg';
  static const String creditcard_details =
      'assets/icons/creditcard_details.svg';
  static const String crown = 'assets/icons/crown.svg';
  static const String document = 'assets/icons/document.svg';
  static const String dollar = 'assets/icons/dollar.svg';
  static const String help_center = 'assets/icons/help_center.svg';
  static const String home_selected = 'assets/icons/home_selected.svg';
  static const String home = 'assets/icons/home.svg';
  static const String kpi = 'assets/icons/kpi.svg';
  static const String language = 'assets/icons/language.svg';
  static const String legal_center = 'assets/icons/legal_center.svg';
  static const String location = 'assets/icons/location.svg';
  static const String login_qr_code = 'assets/icons/login_qr_code.svg';
  static const String logo_white = 'assets/icons/logo_white.svg';
  static const String logo = 'assets/icons/logo.svg';
  static const String message_circle = 'assets/icons/message_circle.svg';
  static const String message = 'assets/icons/message.svg';
  static const String my_activities = 'assets/icons/my_activities.svg';
  static const String pencil = 'assets/icons/pencil.svg';
  static const String person_square = 'assets/icons/person_square.svg';
  static const String plus = 'assets/icons/plus.svg';
  static const String post_selected = 'assets/icons/post_selected.svg';
  static const String post = 'assets/icons/post.svg';
  static const String posts_selected = 'assets/icons/posts_selected.svg';
  static const String posts = 'assets/icons/posts.svg';
  static const String profile_selected = 'assets/icons/profile_selected.svg';
  static const String profile = 'assets/icons/profile.svg';
  static const String report_and_ticket = 'assets/icons/report_and_ticket.svg';
  static const String search_selected = 'assets/icons/search_selected.svg';
  static const String search = 'assets/icons/search.svg';
  static const String security = 'assets/icons/security.svg';
  static const String settings = 'assets/icons/settings.svg';
  static const String share = 'assets/icons/share.svg';
  static const String star = 'assets/icons/star.svg';
  static const String support = 'assets/icons/support.svg';
  static const String switch_icon = 'assets/icons/switch.svg';
  static const String withdraw = 'assets/icons/withdraw.svg';
  static const String square_and_arrow_up_svg =
      'assets/icons/square_and_arrow_up_svg.svg';
  static const String badge1 = 'assets/icons/badge1.svg';
  static const String badge2 = 'assets/icons/badge2.svg';
  static const String badge3 = 'assets/icons/badge3.svg';
  static const String badge4 = 'assets/icons/badge4.svg';
  static const String badge5 = 'assets/icons/badge5.svg';
  static const String restore_account = 'assets/icons/restore_account.svg';
  static const String login = 'assets/icons/login.svg';
  static const String google = 'assets/icons/google.svg';
  static const String apple = 'assets/icons/apple.svg';
  static const String phone = 'assets/icons/phone.svg';
  static const String message_picture = 'assets/icons/message_picture.svg';
  static const String camera = 'assets/icons/camera.svg';
  static const String camera_green = 'assets/icons/camera_green.svg';
  static const String upload_cv = 'assets/icons/upload_cv.svg';
  static const String sparkles = 'assets/icons/sparkles.svg';
  static const String C = 'assets/icons/C.svg';
}
