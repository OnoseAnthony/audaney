import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:audaney/commons/utils/misc.dart';
import 'package:audaney/widgets/texts/scrolling_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key, this.onChanged}) : super(key: key);

  final ValueChanged<double>? onChanged;
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool showBar = true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        widget.onChanged!(notification.extent);
        if(notification.extent > 0.086){
          showBar = false;
        }else{
          showBar = true;
        }
        return false;
      },
      child: DraggableScrollableSheet(
        initialChildSize: .085,
          minChildSize: .085,
          maxChildSize: 1.0,
          snap: true,
          builder: (_, scrollController){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: showBar ? 8.0 : 0.0),
              padding: EdgeInsets.only(right: showBar ? 8.0 : 0.0),
              decoration: showBar ?
              BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ThemeColor.kBurgundyColor
                // color: Colors.white,
              ) :
              const BoxDecoration(

                gradient: LinearGradient(
                    colors: [
                      ThemeColor.kPrimaryColorAlt,
                      ThemeColor.kPrimaryColorAlt,
                      ThemeColor.kPrimaryColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.6, 1.0],
                    tileMode: TileMode.repeated),
                // color: Colors.white,
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: showBar ? Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 40,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: ThemeColor.kShadeColorAlt,
                          ),
                        ),

                        const SizedBox(width: 4),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [

                            SizedBox(
                              width: size.width / 2,
                              height: 12,
                              child: const ScrollingText(
                                text: "##########################",
                                textStyle:  TextStyle(
                                    color: ThemeColor.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: .2
                                ),
                              ),
                            ),

                            const Text(
                              '### #######',
                              style: TextStyle(
                                  color: ThemeColor.kSecondaryColorAlt,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: .8
                              ),
                            ),

                          ],
                        ),

                        const Spacer(),

                        Container(
                          height: 35,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.kBlackColor.withOpacity(.3),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: ThemeColor.kWhiteColor,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: LinearProgressIndicator(
                        backgroundColor: ThemeColor.kWhiteColor,
                        minHeight: 1,
                        value: .2,
                        valueColor: AlwaysStoppedAnimation<Color>( ThemeColor.kShadeColor),
                      ),
                    ),

                  ],
                )
                    :
                Padding(
                  padding: const EdgeInsets.only(top: 46.0, left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(LucideIcons.chevronDown, size: 22, color: ThemeColor.kWhiteColor),

                          Text('Barnabas', style: TextStyle(
                              color: ThemeColor.kWhiteColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              letterSpacing: .4
                          ),),

                          Icon(LucideIcons.moreHorizontal, size: 22, color: ThemeColor.kWhiteColor),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 40),
                        child: Container(
                          height: 280,
                          width: size.width,
                          color: ThemeColor.kAshColor,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Oshe (feat. The Cavemen.)', style: TextStyle(
                                  color: ThemeColor.kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  letterSpacing: .4
                              )),
                              const SizedBox(height: 8),
                              Text('Kizz Daniel, The Cavemen.', style: TextStyle(
                                  color: ThemeColor.kWhiteColor.withOpacity(.6),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: .2
                              )),
                            ],
                          ),
                          const Spacer(),
                          Icon(LucideIcons.heart, size: 22, color: ThemeColor.kWhiteColor.withOpacity(.6))
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            SliderTheme(
                              data:  SliderThemeData(
                                  trackShape: CustomTrackShape(),
                                  thumbShape: const RoundSliderThumbShape(pressedElevation: 1.0, enabledThumbRadius: 6, disabledThumbRadius: 8)),
                              child: SizedBox(
                                height: 28,
                                width: double.infinity,
                                child: Slider(
                                    value: .4,
                                    onChanged: (value){}),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('3:30', style: TextStyle(
                                    color: ThemeColor.kWhiteColor.withOpacity(.6),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    letterSpacing: .2
                                )),

                                Text('-0:18', style: TextStyle(
                                    color: ThemeColor.kWhiteColor.withOpacity(.6),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    letterSpacing: .2
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(LucideIcons.skipBack, size: 28, color: ThemeColor.kWhiteColor.withOpacity(.6)),
                          const SizedBox(width: 30),
                          InkWell(
                            onTap: (){},
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColor.kWhiteColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: ThemeColor.kPrimaryColor,
                                  size: 32,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          const Icon(LucideIcons.skipForward, size: 28, color: ThemeColor.kWhiteColor),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

