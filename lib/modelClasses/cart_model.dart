import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/modelClasses/products.dart';

class Cart {
  final Product product;
  final bool isPattySingle, isBacon, isCheese, isSauce;
  final double pattyPrice;
  final double quantity;

  Cart({
    required this.product,
    required this.isPattySingle,
    required this.isBacon,
    required this.isCheese,
    required this.isSauce,
    required this.pattyPrice,
    required this.quantity,
  });
}
// Our demo Products

List<Cart> cartProducts = [
  Cart(
      product: Product(
        oneLiner: "Cheesy and Juicy",
        id: 2,
        images: AppConfig.images.burger2,
        title: "ShackBurger*",
        price: 42,
        rating: 4,
        description: description,
        isFavourite: false,
        isMostOrder: false,
      ),
      quantity: 2,
      isBacon: true,
      isCheese: false,
      isPattySingle: false,
      isSauce: true,
      pattyPrice: 469),
  Cart(
      product: Product(
        oneLiner: "Signature Burger",
        id: 4,
        images: AppConfig.images.burger1,
        title: "Shack Special",
        price: 42,
        rating: 4,
        description: description,
        isFavourite: false,
        isMostOrder: false,
      ),
      quantity: 1,
      isBacon: true,
      isCheese: false,
      isPattySingle: false,
      isSauce: true,
      pattyPrice: 469),
  Cart(
      product: Product(
        oneLiner: "Cheesy and Juicy",
        id: 2,
        images: AppConfig.images.burger1,
        title: "ShackBurger*",
        price: 42,
        rating: 4,
        description: description,
        isFavourite: false,
        isMostOrder: false,
      ),
      quantity: 4,
      isBacon: true,
      isCheese: false,
      isPattySingle: false,
      isSauce: true,
      pattyPrice: 469),
  Cart(
      product: Product(
        oneLiner: "Meat blaster.",
        id: 5,
        images: AppConfig.images.burger2,
        title: "For Meat Lover!",
        price: 39,
        rating: 4,
        description: description,
        isFavourite: false,
        isMostOrder: false,
      ),
      quantity: 1,
      isBacon: true,
      isCheese: false,
      isPattySingle: false,
      isSauce: true,
      pattyPrice: 469),
];

const String description =
    "Antibiotic-free, crispy chicken breast with lettuce, pickles, and buttermilk herb mayo on a non-GMO Martin’s Potato Roll.";
