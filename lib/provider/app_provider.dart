import 'package:flutter/cupertino.dart';
import 'package:shake_shack/modelClasses/products.dart';

class AppProvider extends ChangeNotifier {
  int selectedCategory = 0;

  void selectCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  void favProductTab(Product product) {
    product.isFavourite = !product.isFavourite;
    notifyListeners();
  }
}
