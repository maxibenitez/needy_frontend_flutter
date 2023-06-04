import 'package:needy_app_ui/needy_app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NAIconsDark extends NAIcon {
  @override
  SvgPicture backIcon({double? size, Color? color}) {
    return super.backIcon(
      color: color ?? NAColors.white,
      size: size ?? 14,
    );
  }

  @override
  SvgPicture emailOutline({double? size, Color? color}) {
    return super.emailOutline(
      color: color ?? NAColors.white,
      size: size ?? 14,
    );
  }
}