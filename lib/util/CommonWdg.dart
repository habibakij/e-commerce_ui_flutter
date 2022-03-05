import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Common{

  static var mediaQueryHeight= 0.0, mainContainerHeight= 0.0, mediaQueryWidth= 0.0,
      mainContainerWidth= 0.0, fixedHeight= 0.0, halfWidth= 0.0, quaterHalf= 0.0;

  static void dynamicScreenSize(BuildContext context){
    mediaQueryHeight = MediaQuery.of(context).size.height;
    mediaQueryWidth = MediaQuery.of(context).size.width;
    mainContainerHeight = ((mediaQueryHeight / 100.0) * 90.0);
    mainContainerWidth = ((mediaQueryWidth / 100.0) * 90.0);
    fixedHeight = 70;
    halfWidth = (mainContainerWidth / 2) - 10;
    quaterHalf = (mainContainerWidth / 3) - 8;
  }

  static String categoryUri= "https://fakestoreapi.com/products/categories";
  static String productsUri= "https://fakestoreapi.com/products";

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
    //EasyLoading.show(status: "Loading...");
    EasyLoading.isShow;
  }

  static customToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue[900],
        textColor: Colors.white,
        fontSize: 12.0
    );
  }


}