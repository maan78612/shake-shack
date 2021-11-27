import 'package:flutter/material.dart';
import 'package:shake_shack/helper/size_config.dart';

import 'asset_images.dart';
import 'colors.dart';

const kAnimationDuration = Duration(milliseconds: 2500);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final otpInputDecoration = InputDecoration(
  hintText: "Please enter Instructions",
  hintStyle: const TextStyle(
    fontFamily: 'Futura',
    fontSize: 14,
    color: Color(0xffffffff),
    fontWeight: FontWeight.w500,
  ),
  contentPadding: EdgeInsets.symmetric(
      vertical: getProportionateScreenWidth(15),
      horizontal: getProportionateScreenWidth(10)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: AppConfig.colors.borderColor),
  );
}

class AppConfig {
  static AssetImages images = AssetImages();
  static AppColors colors = AppColors();
}
//
// const defaultDuration = Duration(milliseconds: 250);
//
// // Form Error
// final RegExp emailValidatorRegExp =
//     RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
// const String kEmailNullError = "Please Enter your email";
// const String kInvalidEmailError = "Please Enter Valid Email";
// const String kPassNullError = "Please Enter your password";
// const String kShortPassError = "Password is too short";
// const String kMatchPassError = "Passwords don't match";
// const String kNamelNullError = "Please Enter your name";
// const String kPhoneNumberNullError = "Please Enter your phone number";
// const String kAddressNullError = "Please Enter your address";
//

// }
