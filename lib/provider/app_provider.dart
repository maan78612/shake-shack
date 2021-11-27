import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';
import 'package:shake_shack/modelClasses/products.dart';

class AppProvider extends ChangeNotifier {
  int selectedCategory = 0;
  double cartTotal = 309;

  void selectCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }

  void favProductTab(Product product) {
    product.isFavourite = !product.isFavourite;
    notifyListeners();
  }

  void cartSum() {
    for (int x = 0; x < cartProducts.length; x++) {
      cartTotal = (cartProducts[x].product.price * cartProducts[x].quantity) +
          cartTotal;
    }
  }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
