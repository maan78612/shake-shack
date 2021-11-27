import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';
import 'package:shake_shack/provider/app_provider.dart';

import 'Components/check_box.dart';
import 'Components/item_card.dart';

displayDialog(BuildContext context, AppProvider app) {
  String instructions = "";
  bool saveInstruction = false, noCutlery = false, contactlessDelivery = false;
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    transitionDuration: const Duration(milliseconds: 1000),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: const Color(0xbe000000),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x39000000),
                  offset: Offset(0, 0),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                fontFamily: 'Futura',
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Your Cart\n',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: '${cartProducts.length} ',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'Items',
                                  style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 0.22,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: const TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_downward_outlined),
                        iconSize: 20,
                        color: AppConfig.colors.brightPrimaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(cartProducts.length, (index) {
                      Cart cartData = cartProducts[index];
                      return ItemCard(cartData: cartData);
                    }),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Divider(color: AppConfig.colors.borderColor),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Special Instructions',
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontSize: getProportionateScreenWidth(16),
                      color: AppConfig.colors.brightPrimaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Center(
                  child: SizedBox(
                      width: getProportionateScreenWidth(338),
                      child: TextFormField(
                        style: const TextStyle(
                          fontFamily: 'Futura',
                          fontSize: 12,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w500,
                        ),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        textAlign: TextAlign.start,
                        decoration: otpInputDecoration,
                        onChanged: (value) => instructions = value,
                      )),
                ),
                Column(
                  children: [
                    CheckBoxCustom(
                      title: "Save Instructions",
                      checkedValue: saveInstruction,
                    ),
                    CheckBoxCustom(
                        checkedValue: noCutlery, title: "No Cutlery"),
                    CheckBoxCustom(
                        checkedValue: contactlessDelivery,
                        title: "Contactless Delivery"),
                  ],
                ),
                Divider(color: AppConfig.colors.borderColor),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontFamily: 'Futura',
                            fontSize: 16,
                            color: Color(0xffffffff),
                          ),
                          children: [
                            const TextSpan(
                              text: 'Total\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const TextSpan(
                              text: 'AED',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: '${app.cartTotal}',
                              style: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.22,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        textAlign: TextAlign.left,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: getProportionateScreenWidth(123),
                          height: getProportionateScreenHeight(37),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xff55a335),
                            border: Border.all(
                                width: 1.0, color: const Color(0x38707070)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x0f000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontFamily: 'Futura',
                              fontSize: getProportionateScreenWidth(13),
                              color: AppConfig.colors.brightPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
