import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake_shack/UI/HomeScreens/home_screen.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      splash: AppConfig.images.splash,
      backgroundColor: AppConfig.colors.brightPrimaryColor,
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: kAnimationDuration,
    );
  }
}
