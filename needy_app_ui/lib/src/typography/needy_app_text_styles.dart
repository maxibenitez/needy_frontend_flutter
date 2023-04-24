import 'package:flutter/material.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

//extension for font weights

abstract class NATextStyle {
  static const Color defaultColor = NAColors.black;

  /// Base Text Style
  static const _baseTextStyle = TextStyle(
    package: 'needy_app_ui',
    fontWeight: NAFontWeight.regular,
    fontFamily: 'NotoSansDisplay',
    color: NAColors.black,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Display 2 Text Style
  static final TextStyle display2 = _baseTextStyle.copyWith(
    fontSize: 57,
    fontWeight: NAFontWeight.bold,
    height: 1.12,
    letterSpacing: -0.25,
    color: defaultColor,
  );

  /// Display 3 Text Style
  static final TextStyle display3 = _baseTextStyle.copyWith(
    fontSize: 45,
    fontWeight: NAFontWeight.bold,
    height: 1.15,
    color: defaultColor,
  );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: NAFontWeight.bold,
    height: 1.22,
    color: defaultColor,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 32,
    fontWeight: NAFontWeight.bold,
    height: 1.25,
    color: defaultColor,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 28,
    fontWeight: NAFontWeight.semiBold,
    height: 1.28,
    color: defaultColor,
  );

  /// Subtitle 1 Text Style
  static final TextStyle subtitle1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.1,
    color: defaultColor,
  );

  /// Subtitle 2 Text Style
  static final TextStyle subtitle2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.1,
    color: defaultColor,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.5,
    color: defaultColor,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 14,
    height: 1.42,
    letterSpacing: 0.25,
    color: defaultColor,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 12,
    height: 1.33,
    letterSpacing: 0.4,
    color: defaultColor,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 16,
    height: 1.42,
    letterSpacing: 0.1,
    color: defaultColor,
  );

  /// Overline Text Style
  static final TextStyle overline = _baseTextStyle.copyWith(
    fontSize: 25,
    height: 1.33,
    letterSpacing: 0.5,
    color: defaultColor,
  );

  /// Label Small Text Style
  static final TextStyle labelSmall = _baseTextStyle.copyWith(
    fontSize: 11,
    height: 1.45,
    letterSpacing: 0.5,
    color: defaultColor,
  );
}
