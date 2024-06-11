// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:developer' as la;
import '../../linker.dart';
import 'com_screen.dart';
import 'onboarding/walk_through_screen.dart';

printx(String value) {
  return la.log(value);
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  Future<void> init() async {
    afterBuildCreated(() async {
      // if (getBoolAsync(IS_FIRST_TIME, defaultValue: true)) {
      const WalkThroughScreen().launch(context,
          isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
      // } else {
      // DashboardScreen().launch(context,
      //     isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashComponent.fadeIn(
      backgroundColor: context.scaffoldBackgroundColor,
      childWidget: SizedBox(
        height: 200,
        child: Image.asset("assets/images/splash icon.png"),
      ),
      duration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 1500),
      onAnimationEnd: () async => await init(),
      defaultNextScreen: () async {},
    );
  }
}
