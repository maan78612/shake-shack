import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/modelClasses/products_modall.dart';

class Cart {
  late Data product;
  bool isPattySingle;
  double extraPrice;
  int quantity;

  Cart({
    required this.product,
    required this.isPattySingle,
    required this.extraPrice,
    required this.quantity,
  });
}
// Our demo Products

List<Cart> cartProducts = [
  // Cart(
  //     product: Product(
  //       oneLiner: "Cheesy and Juicy",
  //       id: 2,
  //       images: AppConfig.images.burger2,
  //       title: "ShackBurger*",
  //       price: 42,
  //       rating: 4,
  //       description: description,
  //       isFavourite: false,
  //       isMostOrder: false,
  //     ),
  //     quantity: 2,
  //     isPattySingle: false,
  //     extraPrice: 469),
  // Cart(
  //     product: Product(
  //       oneLiner: "Signature Burger",
  //       id: 4,
  //       images: AppConfig.images.burger1,
  //       title: "Shack Special",
  //       price: 42,
  //       rating: 4,
  //       description: description,
  //       isFavourite: false,
  //       isMostOrder: false,
  //     ),
  //     quantity: 1,
  //     isPattySingle: false,
  //     extraPrice: 469),
  // Cart(
  //     product: Product(
  //       oneLiner: "Cheesy and Juicy",
  //       id: 2,
  //       images: AppConfig.images.burger1,
  //       title: "ShackBurger*",
  //       price: 42,
  //       rating: 4,
  //       description: description,
  //       isFavourite: false,
  //       isMostOrder: false,
  //     ),
  //     quantity: 4,
  //     isPattySingle: false,
  //     extraPrice: 469),
  // Cart(
  //     product: Product(
  //       oneLiner: "Meat blaster.",
  //       id: 5,
  //       images: AppConfig.images.burger2,
  //       title: "For Meat Lover!",
  //       price: 39,
  //       rating: 4,
  //       description: description,
  //       isFavourite: false,
  //       isMostOrder: false,
  //     ),
  //     quantity: 1,
  //     isPattySingle: false,
  //     extraPrice: 469),
];

const String description =
    "Antibiotic-free, crispy chicken breast with lettuce, pickles, and buttermilk herb mayo on a non-GMO Martin’s Potato Roll.";
