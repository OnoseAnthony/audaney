import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:flutter/material.dart';


abstract class ThemeTextStyles{

  static TextStyle kSmallTextStyle(ThemeMode themeMode,
      {Color? color,
        double? fontSize,
        double? letterSpacing,
        double? height,
        FontWeight? fontWeight}) =>
      TextStyle(
          color: color ?? ThemeColor.kCaptionColor(themeMode),
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: height,
          letterSpacing: letterSpacing ?? 0.4);

  static TextStyle kTextInputStyle(ThemeMode themeMode,
      {Color? color, double fontSize = 14.0}) =>
      TextStyle(
          letterSpacing: 0.01,
          color: color ?? ThemeColor.kBaseColor(themeMode),
          fontWeight: FontWeight.w500,
          fontSize: fontSize);
}