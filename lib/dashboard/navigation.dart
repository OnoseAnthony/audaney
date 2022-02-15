import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:audaney/dashboard/explore/home_screen.dart';
import 'package:audaney/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

import 'explore/player_screen.dart';
import 'explore/explore_shazam.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  bool hideNav =  false;
  int _currentIndex = 0;
  final List<Widget> _childrenUser = [
    const HomeScreen(),
    const ShazamScreen(),
    const SizedBox(),
    const SizedBox()
  ];

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawerScrimColor: ThemeColor.kBaseColor(themeMode).withOpacity(.2),
      body: Stack(
        children: [

          getChildren(),

          // Positioned(
          //   bottom: 0,
          //     left: 0,
          //     right: 0,
          //     child: SizedBox(
          //         height: MediaQuery.of(context).size.height * .92,
          //         child: PlayerScreen(
          //           onChanged: (term) {
          //             if(!hideNav && term >= .99){
          //               hideNav = true;
          //               setState(() {});
          //             }else if(hideNav && term <= 0.086){
          //               hideNav = false;
          //               setState(() {});
          //             }
          //           },
          //         )),
          // ),
        ],
      ),
      bottomNavigationBar: hideNav ? const SizedBox() : CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() {
          _currentIndex = i!;
        }),
      ),
    );
  }
  getChildren() {
    return _childrenUser[_currentIndex];
  }
}
