import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shake_shack/UI/HomeScreens/home_screen.dart';
import 'package:shake_shack/UI/splash_screen.dart';
import 'package:shake_shack/helper/constants.dart';
import 'package:shake_shack/helper/size_config.dart';
import 'package:shake_shack/provider/app_provider.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  bool isChecking = false;
  final String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      setState(() {
        isChecking = true;
      });
      result = await _connectivity.checkConnectivity();
      setState(() {
        isChecking = false;
      });
    } on PlatformException catch (e) {
      log(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    bool isConnected =
        await Provider.of<AppProvider>(context, listen: false).check();
    if (isConnected) {
      Navigator.of(context).popUntil((predicate) => predicate.isFirst);
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  // void startConnectionStream() {
  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }

  Future<bool> checkBeforeGoingBack() async {
    ConnectivityResult result;
    result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  void initState() {
    initConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: checkBeforeGoingBack,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConfig.colors.appPrimaryColor,
          title: const Text(
            "No Internet",
            style: TextStyle(
              fontFamily: 'Bahnschrift',
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: SizedBox(),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    noInternetWidget(scale: 1),
                    Container(
                      child: const Text(
                        "No Internet Connection",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'monts',
                          fontWeight: FontWeight.bold,
                          // color:
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: isChecking
                      ? const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(),
                        )
                      : _retryButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _retryButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: () {
                initConnectivity();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                width: SizeConfig.screenWidth * 0.8,
                height: SizeConfig.screenHeight * 0.06,
                margin: EdgeInsets.only(
                  top: SizeConfig.screenHeight * .015,
                  // bottom:
                  //     MediaQuery.of(context).size.height * .04,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppConfig.colors.appPrimaryColor.withOpacity(0.5),
                        AppConfig.colors.appPrimaryColor.withOpacity(0.8)
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(0.16),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Retry",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget noInternetWidget({double scale = 2}) {
    return Center(
        child: Image.asset(
      AppConfig.images.noInternet,
      scale: scale,
    ));
  }
}
