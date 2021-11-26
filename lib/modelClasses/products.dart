import 'package:shake_shack/helper/constants.dart';

class Product {
  final int id;
  final String title, description, oneLiner;
  final String images;
  final double rating, price;
  bool isFavourite, isMostOrder;

  Product({
    required this.oneLiner,
    required this.isMostOrder,
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    oneLiner: "Crissssssssspy",
    id: 1,
    images: AppConfig.images.mostOrdered,
    title: "Chick’n Shack",
    price: 42,
    rating: 4,
    description: description,
    isFavourite: true,
    isMostOrder: true,
  ),
  Product(
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
  Product(
    oneLiner: "Juicy just got juicier.",
    id: 3,
    images: AppConfig.images.burger2,
    title: "B-b-bacon!",
    price: 39,
    rating: 4,
    description: description,
    isFavourite: true,
    isMostOrder: false,
  ),
  Product(
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
  Product(
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
];

const String description =
    "Antibiotic-free, crispy chicken breast with lettuce, pickles, and buttermilk herb mayo on a non-GMO Martin’s Potato Roll.";
