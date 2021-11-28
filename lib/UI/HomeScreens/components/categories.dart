import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/provider/app_provider.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": AppConfig.images.category1},
      {"icon": AppConfig.images.category2},
      {"icon": AppConfig.images.category3},
      {"icon": AppConfig.images.category4},
      {"icon": AppConfig.images.category5},
    ];

    return Consumer<AppProvider>(builder: (context, app, _) {
      return Container(
        height: getProportionateScreenWidth(65),
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(5),
            horizontal: getProportionateScreenWidth(20)),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
            categories.length,
            (index) => CategoryCard(
              icon: categories[index]["icon"],
              press: () {
                app.selectCategory(index);
              },
              index: index,
            ),
          ),
        ),
      );
    });
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.press,
    required this.index,
  }) : super(key: key);

  final String? icon;
  final GestureTapCallback press;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, app, _) {
      return GestureDetector(
        onTap: press,
        child: Container(
          width: getProportionateScreenWidth(62),
          margin: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          decoration: BoxDecoration(
              color: !app.selectedCategory.contains(index)
                  ? AppConfig.colors.brightPrimaryColor
                  : const Color(0xFFE9F4E6),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: app.selectedCategory.contains(index)
                      ? const Color(0xFF55A335)
                      : AppConfig.colors.darkPrimaryColor,
                  width: 1.5)),
          child: SizedBox(
            height: getProportionateScreenWidth(30),
            child: Image.asset(icon!,
                fit: BoxFit.contain,
                color: app.selectedCategory.contains(index)
                    ? const Color(0xFF55A335)
                    : AppConfig.colors.darkPrimaryColor),
          ),
        ),
      );
    });
  }
}
