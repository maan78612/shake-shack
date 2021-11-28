import 'package:flutter/widgets.dart';
import 'package:shake_shack/UI/HomeScreens/home_screen.dart';
import 'package:shake_shack/UI/ProductDetailScreen/product_detail.dart';
import 'package:shake_shack/UI/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductDetailsPage.routeName: (context) => const ProductDetailsPage(),
};
