import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shake_shack/Services/home_services.dart';
import 'package:shake_shack/modelClasses/cart_model.dart';
import 'package:shake_shack/modelClasses/products_modall.dart';

class AppProvider extends ChangeNotifier {
  List<int> selectedCategory = [];
  double cartTotal = 0;
  Product productList = Product(message: '', data: []);

  void selectCategory(int index) {
    selectedCategory.clear();
    selectedCategory.add(index);
    notifyListeners();
  }

  void selectCategories(int index) {
    if (selectedCategory.contains(index)) {
      selectedCategory.remove(index);
    } else {
      selectedCategory.add(index);
    }

    notifyListeners();
  }

  void favProductTab(Data product) {
    if (product.isFavourite == false) {
      product.isFavourite = true;
    } else {
      product.isFavourite = false;
    }

    notifyListeners();
  }

  void cartSum() {
    cartTotal = 0;
    for (int x = 0; x < cartProducts.length; x++) {
      cartTotal = (cartProducts[x].product.price! * cartProducts[x].quantity) +
          cartTotal;
    }
    notifyListeners();
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

  void addToCart(Cart addToCart, Data product) {
    addToCart.product = product;
    cartProducts.add(addToCart);
    cartSum();
    print("$cartTotal");
    notifyListeners();
  }

  ////////////////////////////// BACK END ///////////////////////////

  bool isLoading = false;
  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<void> getProducts() async {
    productList = Product.fromJson({});
    productList.data = [];
    startLoading();
    productList = (await HomeServices.getProducts(productList, Get.context))!;
    print("================= \n");
    print(productList.toJson());
    print(productList.data?.length ?? 0);
    print("================= \n");

    endLoading();
    notifyListeners();
  }
}
