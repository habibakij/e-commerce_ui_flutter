import 'package:akij_mia/ui/product.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../controller/productcontroller.dart';
import '../util/CommonWdg.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  late final ScrollController _scrollViewController = ScrollController();
  String imageUri =
      "https://w7.pngwing.com/pngs/310/974/png-transparent-two-dots-microphone-microphone-electronics-logo-monochrome-thumbnail.png";
  var appController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    Common.dynamicScreenSize(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(
                imageUri,
                height: 30,
                width: 15,
              ),
              Image.network(
                imageUri,
                height: 30,
                width: 15,
              ),
              Container(
                alignment: Alignment.center,
                width: 250,
                child: const Text(
                  "XE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: _scrollViewController,
          child: Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.only(left: 7, right: 7, bottom: 7),
            //color: Colors.grey.withOpacity(.1),
            child: Card(
              elevation: 0,
              color: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: Common.halfWidth,
                          height: 40,
                          child: const Text(
                            "Our Product",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: (Common.halfWidth / 2) + 30,
                          height: 40,
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Sort by",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          width: (Common.halfWidth / 2) - 30,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Card(
                          margin: const EdgeInsets.all(2),
                          elevation: 5,
                          color: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Common.quaterHalf - 2,
                            height: 40,
                            alignment: Alignment.center,
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.star),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Sneakers",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(2),
                          elevation: 5,
                          color: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Common.quaterHalf - 2,
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(2),
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.star),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Watch",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.all(2),
                          elevation: 5,
                          color: Colors.white.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: Common.quaterHalf - 2,
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(2),
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.star),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "BackPack",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Common.mainContainerHeight,
                      child: Obx(
                        () => AlignedGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          itemCount: appController.productList.value.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 260,
                              child: Card(
                                elevation: 5,
                                color: Colors.white.withOpacity(0.9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[

                                        SizedBox(
                                          height: 30,

                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                height: 30,
                                                width: 40,
                                                margin: const EdgeInsets.only(left: 5, top: 5),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey.withOpacity(.20),
                                                    width: 1,
                                                  ),
                                                  color: Colors.blue[200],
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: const Text(
                                                  "30 %",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 30,
                                                margin: const EdgeInsets.only(right: 5, top: 5),
                                                child: const Icon(
                                                  Icons.favorite,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 100,
                                          margin: const EdgeInsets.only(top: 10),
                                          child: Obx(
                                            () => CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage("${appController!.productList.value[index]["image"].toString()}"),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 20,
                                          margin: const EdgeInsets.only(top: 20),
                                          child: Obx(
                                            () => Text(
                                              appController.productList.value[index]["title"].toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 20,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: Obx(
                                            () => Text(
                                              appController.productList.value[index]["price"].toString(),
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          height: 20,
                                          margin: const EdgeInsets.only(top: 5),
                                          child: RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 20,
                                            itemPadding: EdgeInsets.zero,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              //print(rating);
                                            },
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(ProductDetailsPage());
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[300]!,
        buttonBackgroundColor: Colors.blue,
        items: const <Widget>[
          Icon(Icons.home_sharp, size: 30),
          Icon(
            Icons.favorite,
            size: 30,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          Icon(
            Icons.text_snippet,
            size: 30,
          ),
          Icon(Icons.account_circle, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
