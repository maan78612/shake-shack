import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shake_shack/helper/colors.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Futura",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}



TextTheme textTheme() {
  return  TextTheme(
    bodyText1: TextStyle(color:AppConfig.colors.darkPrimaryColor),
    bodyText2: TextStyle(color: AppConfig.colors.darkPrimaryColor),
  );
}

AppBarTheme appBarTheme() {
  return  const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
   color: Color(0XFF8B8B8B), fontSize: 18),


  );
}
