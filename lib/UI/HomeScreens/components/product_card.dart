import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/UI/ProductDetailScreen/product_detail.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/products_modall.dart';
import 'package:shake_shack/provider/app_provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    this.width = 120,
    this.aspectRetio = 1.4,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  Data product;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, app, _) {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          ProductDetailsPage.routeName,
          arguments: product,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(
                      width: 1,
                      color: AppConfig.colors.borderColor.withOpacity(0.22))),
              color: AppConfig.colors.brightPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10),
                        horizontal: getProportionateScreenWidth(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? "",
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: getProportionateScreenWidth(14),
                            color: AppConfig.colors.darkPrimaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          product.oneLiner ?? "",
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: getProportionateScreenWidth(11),
                            color: AppConfig.colors.borderColor,
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
                                  color: AppConfig.colors.darkPrimaryColor,
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
                                  color: AppConfig.colors.darkPrimaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const Spacer(),
                              InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {
                                  app.favProductTab(product);
                                },
                                child: Container(
                                  height: getProportionateScreenWidth(25),
                                  width: getProportionateScreenWidth(25),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.isFavourite ?? false
                                        ? AppConfig.colors.appPrimaryColor
                                        : AppConfig.colors.darkPrimaryColor,
                                  ),
                                  child: Icon(
                                      product.isFavourite ?? false
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      size: 13,
                                      color:
                                          AppConfig.colors.brightPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -getProportionateScreenWidth(55),
              child: Image.network(
                product.image ?? "",
                fit: BoxFit.contain,
                width: getProportionateScreenWidth(156),
                height: getProportionateScreenWidth(156),
              ),
            ),
          ],
        ),
      );
    });
  }
}
