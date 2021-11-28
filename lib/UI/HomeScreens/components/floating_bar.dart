import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';
import 'package:shake_shack/provider/app_provider.dart';

import '../../CartScreen/cart_screen.dart';

class FloatingBar extends StatelessWidget {
  const FloatingBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Container(
          margin: const EdgeInsets.all(20),
          height: getProportionateScreenHeight(50),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: AppConfig.colors.darkPrimaryColor.withOpacity(0.75),
            boxShadow: [
              BoxShadow(
                color: AppConfig.colors.darkPrimaryColor.withOpacity(0.30),
                offset: const Offset(0, 0),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (cartProducts.isEmpty) const Spacer(),
                  cartProducts.isNotEmpty
                      ? Row(
                          children: [
                            Row(
                              children:
                                  List.generate(cartProducts.length, (index) {
                                var cartData = cartProducts[index];
                                return index < 3
                                    ? Container(
                                        height: getProportionateScreenWidth(37),
                                        width: getProportionateScreenWidth(37),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 2,
                                                color: AppConfig
                                                    .colors.borderColor),
                                            shape: BoxShape.circle,
                                            color: Colors.transparent),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Image.network(
                                            cartData.product.image ?? "",
                                            alignment: Alignment.center,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    : const SizedBox();
                              }),
                            ),
                            if (cartProducts.length > 3)
                              Text(
                                "+${cartProducts.length - 3}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    color: AppConfig.colors.brightPrimaryColor),
                              ),
                          ],
                        )
                      : Text(
                          "Cart is Empty",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              color: AppConfig.colors.brightPrimaryColor),
                          textAlign: TextAlign.center,
                        ),
                  if (cartProducts.isEmpty) const Spacer(),
                  if (cartProducts.isNotEmpty)
                    Row(
                      children: [
                        const Text(
                          'AED ',
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: 8,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "${app.cartTotal} ",
                          style: const TextStyle(
                            fontFamily: 'Futura',
                            fontSize: 11,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            displayDialog(context, app);
                          },
                          child: Container(
                            height: getProportionateScreenWidth(35),
                            width: getProportionateScreenWidth(35),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppConfig.colors.appPrimaryColor),
                            child: Icon(Icons.arrow_upward,
                                size: 15,
                                color: AppConfig.colors.brightPrimaryColor),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ));
    });
  }
}
