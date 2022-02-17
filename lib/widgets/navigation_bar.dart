import 'dart:io' show Platform;
import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:audaney/dashboard/explore/explore_shazam.dart';
import 'package:audaney/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, this.currentIndex = 1, this.onTap})
      : super(key: key);

  final int? currentIndex;
  final ValueChanged<int?>? onTap;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ThemeMode.dark;
    return Container(
      height: Platform.isIOS && MediaQuery.of(context).size.height <= 740
          ? 60
          : Platform.isIOS
          ? 75
          : 60,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: 10,
          bottom: Platform.isIOS && MediaQuery.of(context).size.height <= 740
              ? 0
              : Platform.isIOS
              ? 20
              : 0),
      decoration: BoxDecoration(
        color: ThemeColor.kPrimaryColor,
        border: Border(
          top: BorderSide(
            color: ThemeColor.kDividerColor(themeMode),
            width: .5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomBarItem(LucideIcons.home, 'Home', 0),
          buildBottomBarItem(LucideIcons.search, 'Explore', 1),
          buildBottomBarItem(LucideIcons.library, 'Your Library', 2),
          buildBottomBarItem(LucideIcons.album, 'Premium', 3)
        ],
      ),
    );
  }

  buildBottomBarItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () async{
        if(index == 1){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const ShazamScreen()));
          return;
        }

        if(index == 2){
          await showDialog(
            useSafeArea: false,
              context: context,
              builder: (context) => SwipeToDismiss(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.red,
                  child: const Text(
                    "Red",
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              )
        );
          return;
        }

        setState(() {
          widget.onTap!(index);
        });
      },
      child: Container(
        color: Colors.transparent,
        height: 48,
        width: MediaQuery.of(context).size.width / 5,
        child: Column(
          children: [
          Icon(
              icon,
              size: 24.0,
              color: index == widget.currentIndex
                  ? ThemeColor.kWhiteColor.withOpacity(.9)
                  : ThemeColor.kWhiteColor.withOpacity(.5),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.24,
                  color: index == widget.currentIndex
                      ? ThemeColor.kWhiteColor.withOpacity(.9)
                      : ThemeColor.kWhiteColor.withOpacity(.5)),
            ),
          ],
        ),
      ),
    );
  }
}