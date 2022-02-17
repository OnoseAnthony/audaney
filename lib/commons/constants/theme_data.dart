import 'package:flutter/material.dart';
import 'package:audaney/commons/constants/theme_colors.dart';

abstract class ThemeStyle {
  static ThemeData themeData(ThemeMode themeMode) {
    return ThemeData(
      fontFamily: '',
      primaryColor: ThemeColor.kPrimaryColor,
      backgroundColor: ThemeColor.kBackgroundColor(themeMode),
      scaffoldBackgroundColor: ThemeColor.kBackgroundColor(themeMode),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: ThemeColor.kPrimaryColorAlt,
        elevation: 0
      ),
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          primaryColorDark: ThemeColor.kPrimaryColor,
          accentColor: ThemeColor.kPrimaryColor.withOpacity(.15),
          backgroundColor: ThemeColor.kBackgroundColor(themeMode),
          errorColor: ThemeColor.kErrorColor(themeMode),
          brightness: ThemeColor.kBrightness(themeMode)
      ).copyWith(secondary: ThemeColor.kPrimaryColor.withOpacity(0.1)),
      // pageTransitionsTheme: const PageTransitionsTheme(builders: {
      //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // }),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: ZoomPageTransitionsBuilder()
        },
      ),

    );
  }
}
