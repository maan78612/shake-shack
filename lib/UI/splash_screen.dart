import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/UI/HomeScreens/home_screen.dart';
import 'package:shake_shack/UI/no_internet.dart';
import 'package:shake_shack/helper/connectivity_services.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/provider/app_provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ConnectivityServices _con = ConnectivityServices();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1600), () => onInit());
    super.initState();
  }

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

  onInit() async {
    bool connected =
        await Provider.of<AppProvider>(context, listen: false).check();
    if (!connected) {
      Get.to(NoInternetScreen());
      return;
    }
  }
}
