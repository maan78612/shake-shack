import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shake_shack/UI/no_Internet.dart';

class ConnectivityServices {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
      if (result != ConnectivityResult.none) {}
    } on PlatformException catch (e) {
      print(e.toString());
    }
    // if (!mounted) {
    //   return Future.value(null);
    // }

    return _updateConnectionStatus(result);
  }

  bool hasConnection() => false;
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        {
          print(result);
          hasConnection() => true;
        }
        break;
      case ConnectivityResult.mobile:
        {
          print(result);
          hasConnection() => true;
        }
        break;
      case ConnectivityResult.none:
        {
          Fluttertoast.showToast(
              msg: "Uh Oh!" + " No Internet Connection",
              fontSize: 14,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER);
          Get.to(NoInternetScreen());
          hasConnection() => false;
        }
        break;
      // setState(() => _connectionStatus = result.toString());
      // break;
      default:
        _connectionStatus = 'Failed to get connectivity.';
        hasConnection() => false;
        break;
    }
    print(result);
  }

  void startConnectionStream() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void stopStream() {
    _connectivitySubscription?.cancel();
  }
}
