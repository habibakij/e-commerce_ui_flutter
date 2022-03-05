import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../util/CommonWdg.dart';

class ProductsController extends GetxController {


  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  var productList= [].obs;
  RxString image= "".obs;
  Future<void> getAllProducts() async{
    EasyLoading.show(status: "Please Wait...");
    try{
      var response = await http.get(Uri.parse(Common.productsUri));
      print("product_response: ${response.body}");
      if(response.statusCode == 200){
        EasyLoading.dismiss();
        productList.value= jsonDecode(response.body);
        image.value= productList.value[1]["image"];
        print("check_decode: ${productList.value.length}");
      } else {
        EasyLoading.dismiss();
        Common.customToast("Internal error occur, Please try again");
      }
    } catch(_){
      EasyLoading.dismiss();
      print("catch_error: ${_.toString()}");
      Common.customToast("Somethings want wrong, Please try again");
    }
  }

}