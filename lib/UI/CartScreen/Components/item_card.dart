import 'package:flutter/material.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';

class ItemCard extends StatelessWidget {
  Cart cartData;
  ItemCard({
    Key? key,
    required this.cartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(75),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xbe575757),
        boxShadow: const [
          BoxShadow(
            color: Color(0x39000000),
            offset: Offset(0, 0),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -6,
                  right: -8,
                  child: Text(
                    "x${cartData.quantity.toInt()}",
                    style: TextStyle(
                      fontFamily: 'Futura',
                      fontSize: getProportionateScreenWidth(12),
                      color: const Color(0xff55a335),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  height: getProportionateScreenWidth(67),
                  width: getProportionateScreenWidth(67),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: AppConfig.colors.borderColor),
                      shape: BoxShape.circle,
                      color: Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      cartData.product.image ?? "",
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
            Text(
              cartData.product.title ?? "",
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: getProportionateScreenWidth(15),
                color: AppConfig.colors.brightPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            Text(
              'AED',
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: getProportionateScreenWidth(13),
                color: AppConfig.colors.brightPrimaryColor,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(width: 3),
            Text(
              "${cartData.product.price}",
              style: TextStyle(
                fontFamily: 'Futura',
                fontSize: getProportionateScreenWidth(13),
                color: AppConfig.colors.brightPrimaryColor,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            )
          ],
        ),
      ),
    );
  }
}
