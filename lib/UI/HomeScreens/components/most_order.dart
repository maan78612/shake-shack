import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/products.dart';
import 'package:shake_shack/provider/app_provider.dart';

class MostOrder extends StatelessWidget {
  final Product product;
  const MostOrder({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fillPercent = 50; // fills 50% for container from bottom
    const double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];
    final List<Color> gradient = [
      AppConfig.colors.brightPrimaryColor,
      AppConfig.colors.brightPrimaryColor,
      AppConfig.colors.darkPrimaryColor,
      AppConfig.colors.darkPrimaryColor,
    ];

    return Consumer<AppProvider>(builder: (context, app, _) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight * 0.135,
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Most ordered',
                        style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: getProportionateScreenWidth(8),
                          color: AppConfig.colors.brightPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: getProportionateScreenWidth(14),
                          color: AppConfig.colors.brightPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        product.oneLiner,
                        style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: getProportionateScreenWidth(11),
                          color: AppConfig.colors.brightPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(5)),
                        child: Row(
                          children: [
                            Text(
                              'AED',
                              style: TextStyle(
                                fontFamily: 'Futura',
                                fontSize: getProportionateScreenWidth(8),
                                color: AppConfig.colors.brightPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "${product.price}",
                              style: TextStyle(
                                fontFamily: 'Futura',
                                fontSize: getProportionateScreenWidth(11),
                                color: AppConfig.colors.brightPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                    child: Image.asset(
                  product.images,
                )),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppConfig.colors.borderColor),
              gradient: LinearGradient(
                colors: gradient,
                stops: stops,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),
          Positioned(
            right: getProportionateScreenWidth(10),
            top: -getProportionateScreenWidth(10),
            child: InkWell(
              onTap: () {
                app.favProductTab(product);
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: product.isFavourite
                      ? AppConfig.colors.appPrimaryColor
                      : AppConfig.colors.darkPrimaryColor,
                ),
                child: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 15,
                    color: AppConfig.colors.brightPrimaryColor),
              ),
            ),
          ),
        ],
      );
    });
  }
}
