import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/UI/HomeScreens/components/product_card.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/modelClasses/products_modall.dart';
import 'package:shake_shack/provider/app_provider.dart';

import 'components/categories.dart';
import 'components/floating_bar.dart';
import 'components/most_order.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey1 = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Provider.of<AppProvider>(context, listen: false).getProducts();
    });
    super.initState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, app, _) {
      return Scaffold(
          key: scaffoldKey1,
          extendBody: true,
          backgroundColor: AppConfig.colors.brightPrimaryColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: customAppBar(),
          ),
          body: ModalProgressHUD(
            inAsyncCall: app.isLoading,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 10),
                  const Categories(),
                  Image.asset(AppConfig.images.banner),
                  if ((app.productList.data?.length ?? 0) != 0)
                    MostOrder(
                        product: app.productList.data!.firstWhere(
                            (element) => element.isMostOrder == true)),
                  SizedBox(height: getProportionateScreenHeight(60)),
                  (app.productList.data?.length ?? 0) != 0
                      ? gridView(app)
                      : Center(
                          child: Text(
                            "No product to show",
                            style: TextStyle(
                              fontFamily: 'Futura',
                              fontSize: getProportionateScreenWidth(20),
                              color: AppConfig.colors.appPrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                  const SizedBox(height: 120)
                ]),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatingBar());
    });
  }

  Container gridView(AppProvider app) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: SizeConfig.screenWidth,
      // height: SizeConfig.screenHeight,
      child: CustomScrollView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        slivers: [
          SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 60,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.88,
            children: List.generate(
                app.productList.data
                        ?.where((element) => element.isMostOrder != true)
                        .length ??
                    0, (index) {
              Data data = app.productList.data!
                  .where((element) => element.isMostOrder != true)
                  .toList()[index];
              return ProductCard(product: data);
            }),
          )
        ],
      ),
    );
  }

  Widget customAppBar() {
    return SafeArea(
      child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          height: getProportionateScreenWidth(40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  scaffoldKey1.currentState!.openDrawer();
                },
                child: Image.asset(
                  AppConfig.images.drawer,
                  width: getProportionateScreenWidth(17),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ORDER To',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(13),
                          color: AppConfig.colors.appPrimaryColor),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Jumeirah Lake Towers',
                      style: TextStyle(
                        fontFamily: 'Futura',
                        fontSize: getProportionateScreenWidth(16),
                        color: AppConfig.colors.darkPrimaryColor,
                        letterSpacing: -0.28,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ]),
              const Spacer(),
              Image.asset(
                AppConfig.images.mic,
                width: getProportionateScreenWidth(14),
                height: getProportionateScreenWidth(14),
              ),
              const SizedBox(width: 15),
              Image.asset(
                AppConfig.images.search,
                width: getProportionateScreenWidth(14),
                height: getProportionateScreenWidth(14),
              ),
              const SizedBox(width: 15),
              Image.asset(
                AppConfig.images.slider,
                width: getProportionateScreenWidth(14),
                height: getProportionateScreenWidth(14),
              ),
            ],
          )),
    );
  }
}
