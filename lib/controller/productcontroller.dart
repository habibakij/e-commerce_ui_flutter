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
    getAllCategory();
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


  RxString productTitle= "".obs, productImage= "".obs, productsPrice= "".obs, rating= "".obs;
  List productRating= [].obs;
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
        productRating.add(decode["rating"]);
        rating.value= productRating[1]["rate"].toString();
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



  var categoryImageList= [
    "https://wallpaperaccess.com/full/85814.jpg",
    "https://static8.depositphotos.com/1177973/856/i/600/depositphotos_8563781-stock-photo-various-gold-jewellery-on-black.jpg",
    "https://www.industryfreak.com/wp-content/uploads/2019/09/Tip-17-for-mens-fashion-guide-Choose-the-right-perfume.jpg",
    "https://blog.tuv.com/wp-content/uploads/2020/10/Second-Hand-1080x630.jpg",
  ].obs;
  var categoryList= [].obs;
  Future<void> getAllCategory() async{
    EasyLoading.show(status: "Please Wait...");
    try{
      var response = await http.get(Uri.parse(Common.productsAllCategoryUri));
      print("category_response: ${response.body}");
      if(response.statusCode == 200){
        EasyLoading.dismiss();
        var decode= jsonDecode(response.body);
        categoryList.value= decode;
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