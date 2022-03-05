import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../ui/product.dart';
import '../util/CommonWdg.dart';

class ProductsController extends GetxController {

  RxInt selectProductID= 0.obs;

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


  RxString productTitle= "".obs, productImage= "".obs, productsPrice= "".obs;
  var productRating= [].obs;
  Future<void> getProductDetails(int id) async{
    EasyLoading.show(status: "Please Wait...");
    try{
      var response = await http.get(Uri.parse(Common.singleProductsUri+id.toString()));
      print("product_details_response: ${response.body}");
      if(response.statusCode == 200){
        EasyLoading.dismiss();
        var decode= jsonDecode(response.body);
        productTitle.value= decode["title"].toString();
        productImage.value= decode["image"].toString();
        productsPrice.value= decode["price"].toString();
        print("check_products: ${productTitle.value} -- ${productImage.value} -- ${productsPrice.value}");
        Get.to(ProductDetailsPage());
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