import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:lucide_icons/lucide_icons.dart';


class ShazamScreen extends StatefulWidget {
  const ShazamScreen({Key? key}) : super(key: key);

  @override
  _ShazamScreenState createState() => _ShazamScreenState();
}

class _ShazamScreenState extends State<ShazamScreen> {

  bool animate = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(100.0),
              onTap:()=> Navigator.pop(context),
              child: Container(height: 5, width: 5,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(LucideIcons.arrowLeft))),
          backgroundColor: const Color(0xff060405),
        ),
        backgroundColor: const Color(0xff060405),
        body: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: const [
                      Text(
                        'Music Search!',
                        style: TextStyle(
                            color: ThemeColor.kWhiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            letterSpacing: .01
                        ),
                      ),
                    ],
                  ),

                  AvatarGlow(
                    glowColor: const Color(0xFF989695),
                    endRadius: 200,
                    repeat: true,
                    animate: animate,
                    child:  InkWell(
                      borderRadius: BorderRadius.circular(55.0),
                      onTap: (){
                        setState(() {
                          animate = !animate;
                        });
                      },
                      child: Material(     // Replace this child with your own
                        elevation: 8.0,
                        shape: const CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffF3F3F3),
                          child: Icon(animate ? Icons.mic : Icons.mic_off, size: 45, color: const Color(0xff060405)),
                          radius: 55.0,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    children: [

                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:   [
                          Text(
                            'Looking for an artist or a song?',
                            style: TextStyle(
                                color: ThemeColor.kWhiteColor.withOpacity(.9),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                letterSpacing: .01
                            ),
                          ),
                          const Text(
                            'Touch the screen to listen to the song.',
                            style: TextStyle(
                                color: Color(0xFF989695),
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                letterSpacing: .65
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
