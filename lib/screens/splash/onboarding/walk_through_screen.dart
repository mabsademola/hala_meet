// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../../linker.dart';
import '../../auth/login.dart';

// import '../main.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  List<WalkThroughModelClass> pages = [];
  int currentPosition = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    init();

    afterBuildCreated(() async {
      pages.addAll([
        WalkThroughModelClass(
            title: lan.walkTitle1,
            image: 'assets/images/i1.png',
            subTitle: lan.walkThrough1),
        WalkThroughModelClass(
            title: lan.walkTitle2,
            image: 'assets/images/i2.png',
            subTitle: lan.walkThrough2),
        WalkThroughModelClass(
            title: lan.walkTitle3,
            image: 'assets/images/i3.png',
            subTitle: lan.walkThrough3)
      ]);

      setState(() {});
      1.seconds.delay;
      setState(() {});
    });
  }

  init() async {
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    WalkThroughModelClass page = pages[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(page.image.validate(),
                            height: context.height() * 0.45),
                        30.height,
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(pages.length, (index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 3),
                                height: 6,
                                width: (index + 1) ==
                                        (currentPosition == 0
                                            ? 1
                                            : currentPosition)
                                    ? 19
                                    : 6,
                                decoration: BoxDecoration(
                                    color: (index + 1) ==
                                            (currentPosition == 0
                                                ? 1
                                                : currentPosition)
                                        ? context.primaryColor
                                        : context.primaryColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(6)),
                              );
                            })),
                        36.height,
                        CustomWidget.text7(page.title.toString(),
                            textAlign: TextAlign.center, fontSize: 32),
                        10.height,
                        CustomWidget.text3(page.subTitle.toString(),
                            textAlign: TextAlign.center, fontSize: 14)
                      ],
                    );
                  },
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (nnum) {
                    currentPosition = nnum + 1;
                    setState(() {});
                  },
                ),
              ),
              52.height,
              AppButton(
                onTap: () {
                  const LoginScreen().launch(context,
                      pageRouteAnimation: PageRouteAnimation.Fade);
                },
                text: lan.next,
                width: context.width(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
