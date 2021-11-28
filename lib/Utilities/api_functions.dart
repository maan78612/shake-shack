import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:shake_shack/Utilities/show_custom_messages.dart';

import 'header.dart';

class ApiRequests {
  Future getApi({required String url}) async {
    bool isConnected = await checkInternet();
    if (!isConnected) {
      ShowMessageCustom.inDialog("No internet Connection", true);
      return false;
    }
    try {
      var response =
          await http.get(Uri.parse(url), headers: MyHeaders.header());
      print(response.body);
      print(response.statusCode);
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        ShowMessageCustom.ofJsonInDialog(jsonResponse["message"], true);
        return false;
      }
    } on SocketException {
      ShowMessageCustom.inDialog('No Internet Connection', true);

      print('No Internet connection');
      return false;
    } on HttpException catch (error) {
      print(error);
      ShowMessageCustom.inDialog('Couldn\'t find the results', true);
      print("Couldn't find the post");
      return false;
    } on FormatException catch (error) {
      print(error);
      ShowMessageCustom.inDialog('Bad response format from server', true);
      print("Bad response format");
      return false;
    } catch (value) {
      print(value);
    }
    return false;
  }

  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        return true;
      }
    } on SocketException catch (_) {
      print('not connected');
      return false;
    }
    return false;
  }
}
