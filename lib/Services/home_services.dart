import 'package:flutter/cupertino.dart';
import 'package:shake_shack/Utilities/api_functions.dart';
import 'package:shake_shack/Utilities/api_urls.dart';

import 'package:shake_shack/modelClasses/products_modall.dart';

class HomeServices {
  static Future<Product?> getProducts(
      Product data, BuildContext? context) async {
    ApiRequests api = ApiRequests();
    String url = Apis.productApi;
    print(url);
    var res = await api.getApi(url: url);

    if (res != false) {
      print("response  $res");
      data = Product.fromJson(res);
      return data;
    } else {
      return null;
    }
  }
}
