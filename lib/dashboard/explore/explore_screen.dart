import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:audaney/commons/utils/misc.dart';
import 'package:audaney/widgets/form_fields/search_input.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isScrolledToSearchBar = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (mounted) {
        setState(() {
          isScrolledToSearchBar = isScrollInRange(
            scrollController: _scrollController,
            isInRange: isScrolledToSearchBar,
          );
        });
      }
    });
  }
  @override
  void dispose() {
    textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: isScrolledToSearchBar ? 0 : 2,
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
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
        ),
        child: RefreshIndicator(
          backgroundColor: ThemeColor.kPrimaryColorAlt,
          onRefresh: () async{  },
          child: Scrollbar(
            controller: _scrollController,
            scrollbarOrientation: ScrollbarOrientation.right,
            radius: const Radius.circular(20),
            child: ListView(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              addRepaintBoundaries: false,
              addAutomaticKeepAlives: false,
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome,',
                            style: TextStyle(
                              color: ThemeColor.kSecondaryColorAlt,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              letterSpacing: .8
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Princess!',
                            style: TextStyle(
                              color: ThemeColor.kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                              letterSpacing: .01
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.kAshColor,
                          ),
                          padding: const EdgeInsets.only(right: 16, left: 14),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 50),
                  child: SearchInputField(
                    hintText: "Search for new music...",
                    autoFocus: false,
                    textEditingController: textEditingController,
                    onChanged: (val){
                      setState(() {});
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                      width: size.width,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 7.0,
                        // horizontal gap between chips
                        runSpacing: 9.0,
                        // horizontal gap between rows
                        // direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.start,
                        children: List.generate(6, (index) => Container(
                          height: 60,
                          width: size.width * .45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: ThemeColor.kAshColor.withOpacity(.15),
                            // border: Border.all(
                            //   color: ThemeColor.kAshColor,
                            //   width: .7,
                            // ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)),
                                  color: ThemeColor.kShadeColorAlt
                                  // image: DecorationImage(
                                  //     image:
                                  //     ImageDefinition.loadImage(widget.imagePath).image,
                                  //     fit: BoxFit.cover),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 12),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  child: const Text(
                                    "#######\n#######",
                                    style: TextStyle(
                                      color: ThemeColor.kWhiteColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.4,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )).toList(),
                      )),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Text(
                    'Popular albums',
                    style: TextStyle(
                        color: ThemeColor.kWhiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        letterSpacing: .01
                    ),
                  ),
                ),

                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 80,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ThemeColor.kAshColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '########',
                                style: TextStyle(
                                    color: ThemeColor.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: .2
                                ),
                              ),
                              const SizedBox(height: 4),
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
                        );
                      },
                      separatorBuilder: (_, index){
                        return const SizedBox(width: 4);
                      },
                      itemCount: 10),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 20),
                  child: Text(
                    'Discover new music',
                    style: TextStyle(
                        color: ThemeColor.kWhiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        letterSpacing: .01
                    ),
                  ),
                ),

                ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ThemeColor.kAshColor.withOpacity(.15),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 65,
                                width: 70,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ThemeColor.kShadeColorAlt,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [

                                  Text(
                                    '########',
                                    style: TextStyle(
                                        color: ThemeColor.kWhiteColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: .2
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
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
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index){
                      return const SizedBox(height: 20);
                    },
                    itemCount: 3),

                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  width: size.width,
                  height: 4.0,
                  color: ThemeColor.kShadeColor.withOpacity(.15),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.kAshColor,
                          ),
                          padding: const EdgeInsets.only(right: 16, left: 14),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'More Like',
                            style: TextStyle(
                                color: ThemeColor.kSecondaryColorAlt,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                letterSpacing: .8
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Ajebo Hustlers',
                            style: TextStyle(
                                color: ThemeColor.kWhiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                letterSpacing: .01
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                      width: size.width,
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 30.0,
                        // horizontal gap between chips
                        runSpacing: 20.0,
                        // horizontal gap between rows
                        // direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.start,
                        children: List.generate(6, (index) => SizedBox(
                          width: size.width * .42,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: ThemeColor.kShadeColorAlt,
                                ),
                              ),

                              const SizedBox(height: 12),
                              const Text(
                                '########',
                                style: TextStyle(
                                    color: ThemeColor.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: .2
                                ),
                              ),
                              const SizedBox(height: 4),
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
                        )).toList(),
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 50),
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeColor.kAshColor.withOpacity(.15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.tune),
                        const SizedBox(height: 20),
                        Text(
                          'Go find your\nfavourites.',
                          style: TextStyle(
                              color: ThemeColor.kWhiteColor.withOpacity(.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              letterSpacing: .8
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Text(
                                '###########\n###################.',
                                style: TextStyle(
                                    color: ThemeColor.kSecondaryColorAlt,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    letterSpacing: .4
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * .25),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: ThemeColor.kSecondaryColor,
                                    width: 4
                                  ),
                                  color: ThemeColor.kBlackColor.withOpacity(.4)
                                ),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ThemeColor.kShadeColor,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: ThemeColor.kWhiteColor,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Text(
                    'Artists to follow',
                    style: TextStyle(
                        color: ThemeColor.kWhiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        letterSpacing: .01
                    ),
                  ),
                ),

                SizedBox(
                  height: 130,
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeColor.kAshColor,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '########',
                                style: TextStyle(
                                    color: ThemeColor.kWhiteColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    letterSpacing: .2
                                ),
                              ),
                              const SizedBox(height: 2),
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
                        );
                      },
                      separatorBuilder: (_, index){
                        return const SizedBox(width: 4);
                      },
                      itemCount: 10),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  width: size.width,
                  height: 4.0,
                  color: ThemeColor.kShadeColor.withOpacity(.15),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeColor.kAshColor,
                          ),
                          padding: const EdgeInsets.only(right: 16, left: 14),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Curated For',
                            style: TextStyle(
                                color: ThemeColor.kSecondaryColorAlt,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                letterSpacing: .8
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            'Princess Hottie',
                            style: TextStyle(
                                color: ThemeColor.kWhiteColor,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                letterSpacing: .01
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    height: 160,
                    child: SizedBox(
                      width: size.width * .8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Wrap(
                            direction: Axis.vertical,
                            spacing: 10.0,
                            // horizontal gap between chips
                            runSpacing: 8.0,
                            // horizontal gap between rows
                            // direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            children: List.generate(10, (index) => index == 0 ? Container(
                              height: 160,
                              width: 160,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeColor.kShadeColorAlt,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ThemeColor.kBlackColor.withOpacity(.3),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: ThemeColor.kWhiteColor,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ) : Container(
                              height: 74,
                              width: 74,
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ThemeColor.kShadeColorAlt,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 18,
                                        width: 18,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ThemeColor.kBlackColor.withOpacity(.3),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: ThemeColor.kWhiteColor,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            )).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: Text(
                    'Fans also like',
                    style: TextStyle(
                        color: ThemeColor.kWhiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        letterSpacing: .01
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 20.0,
                        // horizontal gap between chips
                        runSpacing: 30.0,
                        // horizontal gap between rows
                        // direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        alignment: WrapAlignment.start,
                        runAlignment: WrapAlignment.start,
                        children: List.generate(5, (index) => index == 0 ? Container(
                          height: 360,
                          width: 240,
                          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ThemeColor.kShadeColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const Text(
                                'Show Dem Camp',
                                style: TextStyle(
                                    color: ThemeColor.kWhiteColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    letterSpacing: .2
                                ),
                              ),
                              const SizedBox(height: 4),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Icon(Icons.person, size: 20, color: ThemeColor.kWhiteColor),
                                  SizedBox(width: 2),
                                  Text(
                                    '734.1K',
                                    style: TextStyle(
                                        color: ThemeColor.kWhiteColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: .4
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Icon(Icons.play_arrow, size: 20, color: ThemeColor.kWhiteColor),
                                  SizedBox(width: 2),
                                  Text(
                                    '1.3M',
                                    style: TextStyle(
                                        color: ThemeColor.kWhiteColor,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        letterSpacing: .4
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ) : Container(
                            height: 74,
                            width: 74,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeColor.kBlackColor.withOpacity(.5),
                              border: Border.all(
                                color: ThemeColor.kShadeColor,
                                width: 2.5,
                              ),
                            ),
                            child: Container(
                              height: 64,
                              width: 64,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ThemeColor.kAshColor,
                              ),
                            )
                        )).toList(),
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
