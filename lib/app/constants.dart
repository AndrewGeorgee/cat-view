import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constant {
  static const String empty = "";
  static const double dzero = 0.0;
}

void toast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      webShowClose: true,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[300],
      textColor: Colors.white,
      fontSize: 30.0);
}

class JsonAssets {
  static const String loading = "assets/json/loading2.json";
  static const String error = "assets/json/error2.json";
  static const String empty = "assets/json/empty.json";
  static const String success = "assets/json/success2.json";
}
