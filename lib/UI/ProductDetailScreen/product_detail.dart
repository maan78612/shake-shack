import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/UI/HomeScreens/components/categories.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';
import 'package:shake_shack/modelClasses/products_modall.dart';
import 'package:shake_shack/provider/app_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  static String routeName = "/ProductDetails";

  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  Data product = Data();
  int selectedPatty = 0;
  int qty = 1;
  List<int> selectedExtras = [];
  Map pattyValues = {
    "values": [
      {"qty": "Single", "calories": "432"},
      {"qty": "Double", "calories": "864"},
    ]
  };
  List<Map<String, dynamic>> categories = [
    {"icon": AppConfig.images.ingredient1},
    {"icon": AppConfig.images.ingredient2},
    {"icon": AppConfig.images.ingredient3},
    {"icon": AppConfig.images.ingredient4},
    {"icon": AppConfig.images.ingredient5},
    {"icon": AppConfig.images.ingredient6},
  ];

  List<Map<String, dynamic>> extras = [
    {"name": "Add Bacon", "price": 5, "calories": "70"},
    {"name": "Add Cheese", "price": 3, "calories": "120"},
    {"name": "No Sauce", "price": 0, "calories": "-85"},
  ];
  List<int> selectedIngredients = [];
  late Cart addToCart =
      Cart(quantity: 1, product: product, isPattySingle: true, extraPrice: 0);
  @override
  void initState() {
    addToCart.product = product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)!.settings.arguments as Data;
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
        // appBar: RoundedAppBar(),
        body: Consumer<AppProvider>(
          builder: (context, app, _) => Stack(
            children: [
              Positioned(child: RoundedAppBar()),
              SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      children: [
                        AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          leading: const BackButton(),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: InkWell(
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
                            ),
                          ],
                        ),
                        Image.network(
                          product.image ?? "",
                          fit: BoxFit.contain,
                          width: getProportionateScreenWidth(220),
                          height: getProportionateScreenWidth(240),
                        ),
                        _detailsHeadingAndParagraph(),
                        _pattySelection(),
                        _ingredients(app),
                        _extras(),
                        qtyAndAddToCart(app),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }

  Widget _detailsHeadingAndParagraph() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title ?? "",
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: getProportionateScreenWidth(26),
              color: AppConfig.colors.darkPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                'AED ',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: getProportionateScreenWidth(12),
                  color: AppConfig.colors.darkPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                product.price.toString(),
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: getProportionateScreenWidth(12),
                  color: AppConfig.colors.darkPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          Text(
            "Antibiotic-free, crispy chicken breast with lettuce, pickles, and buttermilk herb mayo on a non-GMO Martin’s Potato Roll.",
            style: TextStyle(
              fontFamily: 'Futura',
              fontSize: getProportionateScreenWidth(14),
              color: AppConfig.colors.darkPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _pattySelection() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: getProportionateScreenWidth(12)),
            child: _title("Patty"),
          ),
          Row(
            children: List.generate(pattyValues['values'].length, (index) {
              Map value = pattyValues['values'][index];

              return // Group: Group 14
                  Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPatty = index;
                      if (selectedPatty == 0) {
                        addToCart.isPattySingle = true;
                      } else {
                        addToCart.isPattySingle = false;
                      }
                      selectedPatty = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        right: index == 0 ? getProportionateScreenWidth(10) : 0,
                        left: index == 1 ? getProportionateScreenWidth(10) : 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                      border: Border.all(
                        width: 1.0,
                        color: selectedPatty == index
                            ? Colors.green
                            : Colors.black,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          offset: const Offset(0, 5.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value['qty'],
                            style: TextStyle(
                              fontFamily: 'Futura',
                              fontSize: getProportionateScreenWidth(16),
                              color: AppConfig.colors.darkPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: value['calories'],
                                children: [
                                  TextSpan(
                                      text: " Kcal",
                                      style: TextStyle(
                                        fontFamily: 'Futura',
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color:
                                            AppConfig.colors.darkPrimaryColor,
                                        fontWeight: FontWeight.w500,
                                      ))
                                ],
                                style: TextStyle(
                                  fontFamily: 'Futura',
                                  fontSize: getProportionateScreenWidth(16),
                                  color: AppConfig.colors.darkPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _ingredients(AppProvider app) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(12)),
              child: _title("Ingredients"),
            ),
            Wrap(
              children: List.generate(
                  categories.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CategoryCard(
                          icon: categories[index]["icon"],
                          press: () {
                            app.selectCategories(index);
                          },
                          index: index,
                        ),
                      )),
            )
          ],
        ));
  }

  Widget _extras() {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(12)),
              child: _title("Extras"),
            ),
            Column(
              children: List.generate(extras.length, (index) {
                var extra = extras[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      if (selectedExtras.contains(index)) {
                        selectedExtras.remove(index);
                        addToCart.extraPrice =
                            addToCart.extraPrice - extras[index]['price'];
                      } else {
                        addToCart.extraPrice =
                            extras[index]['price'] + addToCart.extraPrice;
                        selectedExtras.add(index);
                      }
                    });
                  },
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: extra['name'],
                            children: [
                              TextSpan(
                                  text: " (${extra['calories']} kcal)",
                                  style: TextStyle(
                                    fontFamily: 'Futura',
                                    fontSize: getProportionateScreenWidth(14),
                                    color: AppConfig.colors.darkPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ))
                            ],
                            style: TextStyle(
                              fontFamily: 'Futura',
                              fontSize: getProportionateScreenWidth(16),
                              color: AppConfig.colors.darkPrimaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text(
                        "AED ${extra['price']}",
                        style: TextStyle(
                          fontFamily: 'Futura',
                          fontSize: getProportionateScreenWidth(14),
                          color: AppConfig.colors.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  trailing: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    fillColor: MaterialStateProperty.all(
                        AppConfig.colors.appPrimaryColor),
                    side: const BorderSide(width: 0.5),
                    onChanged: (bool? value) {
                      setState(() {
                        if (selectedExtras.contains(index)) {
                          selectedExtras.remove(index);
                          addToCart.extraPrice =
                              addToCart.extraPrice - extras[index]['price'];
                        } else {
                          addToCart.extraPrice =
                              extras[index]['price'] + addToCart.extraPrice;
                          selectedExtras.add(index);
                        }
                      });
                    },
                    value: selectedExtras.contains(index),
                  ),
                );
              }),
            )
          ],
        ));
  }

  Widget qtyAndAddToCart(AppProvider app) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(16),
          vertical: getProportionateScreenHeight(16)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: getProportionateScreenHeight(70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: const Color(0xFFF4F4F4),
                border: Border.all(
                  width: 1.0,
                  color: Colors.black.withOpacity(0.08),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 5.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(getProportionateScreenWidth(4)),
                child: Row(
                  children: [
                    _qtyChangeButton(isAdd: false),
                    Expanded(
                      child: Text("$qty",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: getProportionateScreenWidth(16),
                            color: AppConfig.colors.darkPrimaryColor,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    _qtyChangeButton(isAdd: true),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                app.addToCart(addToCart, product);
                Navigator.pop(context);
              },
              child: Container(
                // width: 186.0,
                height: getProportionateScreenHeight(68),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFF55A335),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      offset: const Offset(0, 5.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: getProportionateScreenHeight(22),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyChangeButton({required bool isAdd}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isAdd) {
            qty += 1;
          } else {
            if (qty > 1) qty -= 1;
          }
          addToCart.quantity = qty;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 5.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(20),
              horizontal: getProportionateScreenHeight(16)),
          child: Center(
            child: Icon(
              isAdd ? Icons.add : Icons.remove,
              size: getProportionateScreenHeight(18),
            ),
          ),
        ),
      ),
    );
  }

  Text _title(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Futura',
        fontSize: getProportionateScreenWidth(18),
        color: AppConfig.colors.darkPrimaryColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(builder: (context, constraint) {
        final width = constraint.maxWidth * 2.5;
        return ClipRect(
          child: OverflowBox(
            maxHeight: double.infinity,
            maxWidth: double.infinity,
            child: SizedBox(
              width: width,
              height: width,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: width / 2 - preferredSize.height / 2.1),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(240.0);
}
