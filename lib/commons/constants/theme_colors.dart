import 'package:flutter/material.dart';
import 'package:audaney/commons/utils/misc.dart';


//***********************************************   THEME COLOR MODES  **********************************************************************//


abstract class ThemeColor{

  static const kPrimaryColor = Color(0xff251356);
  static const kPrimaryColorAlt = Color(0xff272A56);
  static const kSecondaryColor = Color(0xff540FA0);
  static const kSecondaryColorAlt = Color(0xffA47BDD);
  static const kTertiaryColor = Color(0xff4D1ABC);
  static const kTertiaryColorAlt = Color(0xffA7A158);
  static const kShadeColor = Color(0xff7C53D0);
  static const kShadeColorAlt = Color(0xffC2C2FF);
  static const Color kBlackColor = Color(0xff070610);
  static const Color kBurgundyColor = Color(0xff560C1D);
  static const Color kAshColor = Color(0xff6A8893);
  static const Color kOrangeColor = Color(0xffAB320C);
  static const  Color kWhiteColor = Color(0xffFFFFFF);
  static const Color kRedColor = Colors.red;
  static const Color kTransparentColor = Colors.transparent;

  static Color kBackgroundColor(ThemeMode themeMode) {
    return returnPerfectMode(dark: kBlackColor, light: kWhiteColor, themeMode: themeMode);
  }

  static Color kErrorColor(ThemeMode themeMode) {
    return returnPerfectMode(dark: kRedColor, light: kRedColor, themeMode: themeMode);
  }

  static Brightness kBrightness(ThemeMode themeMode) {
    const Brightness dark = Brightness.dark;
    const Brightness light = Brightness.light;
    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Brightness kKeyboardAppearanceColor(ThemeMode themeMode) {
    const Brightness dark = Brightness.dark;
    const Brightness light = Brightness.light;
    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Color kSearchBarFillColor(ThemeMode themeMode) {
    final Color dark =  kBlackColor.withOpacity(.4);
    const Color light = Color(0xffF6F6F7);
    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Color kCaptionColor(ThemeMode themeMode) {
    const Color dark = Color(0xff7D8289);
    const Color light = Color(0xff8E8D93);
    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Color kBaseColor(ThemeMode themeMode) {
    const Color dark = kWhiteColor;
    const Color light = kBlackColor;

    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Color kDividerColor(ThemeMode themeMode) {
    const Color dark = Color(0xff181818);
    const Color light = Color(0xffEFEFEF);
    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }

  static Color kNavBarTextColor(ThemeMode themeMode) {
    const Color dark = Color(0xff666666);
    const Color light = Color(0xffCCCCCC);

    return returnPerfectMode(dark: dark, light: light, themeMode: themeMode);
  }
}