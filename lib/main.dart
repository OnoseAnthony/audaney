import 'package:audaney/dashboard/navigation.dart';
import 'package:flutter/material.dart';

import 'commons/constants/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audaney',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeStyle.themeData(ThemeMode.light),
      darkTheme: ThemeStyle.themeData(ThemeMode.dark),
      home: const NavigationScreen(),
    );
  }
}
