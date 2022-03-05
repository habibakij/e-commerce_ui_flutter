
import 'package:akij_mia/controller/productcontroller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/CommonWdg.dart';
import 'package:get/get.dart';

import 'categories.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingController= TextEditingController();
  late ScrollController _scrollViewController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var appController= Get.put(ProductsController());
  String uri= "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg";

  @override
  void initState() {
    super.initState();
    _scrollViewController= ScrollController();
    Common.configLoading();
  }

  @override
  Widget build(BuildContext context) {
    Common.dynamicScreenSize(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: SizedBox(
          height: 20,
          width: 20,
          child: Image.asset("images/handicon1.png", width: 15, height: 15, fit: BoxFit.none,),
        ),
        title: Container(
          margin: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget> [

              Text(
                "Good Morning",
                style: TextStyle(fontSize: 12, color: Colors.black,),
              ),

              Text(
                "Nicholas",
                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold,),
              ),
            ],
          ),
        ),

        actions: [
          Row(
            children: <Widget> [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: const Icon(Icons.drag_handle, color: Colors.black,),
                    ),
                    onTap: (){
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                ),
              )

            ],
          ),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[300]!,
        buttonBackgroundColor: Colors.amber,
        items: const <Widget>[
          Icon(Icons.home_sharp, size: 30),
          Icon(Icons.mic, size: 30,),
          Icon(Icons.shopping_cart, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          controller: _scrollViewController,
          child: Container(
            padding: const EdgeInsets.only(left: 7, right: 7 ,bottom: 7),
            color: Colors.grey.withOpacity(.1),
            child: Card(
              elevation: 0,
              color: Colors.white.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget> [

                    Container(
                      height: 50,
                      width: Common.mediaQueryWidth,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(.20),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        height: 50,
                        width: Common.mediaQueryWidth,
                        color: Colors.grey[100],
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            focusColor: Colors.blue,
                            border: InputBorder.none,
                            hintText: 'Search Product you wish..',
                            hintStyle: TextStyle(fontSize: 12),
                            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: Common.mediaQueryWidth,
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [

                          SizedBox(
                            width: Common.halfWidth,
                            child: const Text(
                              "Daily Needs",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            width: Common.halfWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget> [

                                Icon(Icons.brightness_1, size: 10,),
                                SizedBox(width: 20,),
                                Icon(Icons.brightness_1, size: 10, color: Colors.grey,),
                                SizedBox(width: 20,),
                                Icon(Icons.brightness_1, size: 10, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 270,
                      child: Obx(() => ListView.builder(
                          itemCount: appController.productList.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 270,
                              //width: Common.halfWidth + 70,
                              margin: const EdgeInsets.only(left: 5),
                              child: Card(
                                margin: const EdgeInsets.only(top: 20),
                                elevation: 0,
                                color: Colors.grey[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    color: Colors.grey[200],
                                    margin: const EdgeInsets.all(2),
                                    child: Column(
                                      children: <Widget> [

                                        Container(
                                          height: 85,
                                          child: Obx(() => Image.network(
                                            appController.productList.value[index]["image"] == null ? uri : appController.productList.value[index]["image"].toString(),
                                            width:100, height: 100,
                                          ),),
                                        ),

                                        Container(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget> [

                                              Container(
                                                height: 50,
                                                width: Common.halfWidth - 20,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.white.withOpacity(.20),
                                                    width: 1,
                                                  ),
                                                  color: Colors.blue.withOpacity(.10),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: const <Widget> [

                                                    Icon(Icons.shopping_cart, color: Colors.blue,),

                                                    Text("Add to cart", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),),

                                                  ],
                                                ),
                                              ),

                                              Container(
                                                  height: 50,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white.withOpacity(.20),
                                                      width: 1,
                                                    ),
                                                    color: Colors.red.withOpacity(.10),
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(Icons.favorite_border, color: Colors.red,),
                                                  )
                                              ),

                                            ],
                                          ),
                                        ),

                                        Container(
                                          height: 45,
                                          width: 200,
                                          margin: const EdgeInsets.only(top: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Obx(() => Text(
                                            appController.productList.value[index]["title"] == null ? "title" : appController.productList.value[index]["title"].toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 16),
                                          ),
                                          ),
                                        ),

                                        Container(
                                          height: 50,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget> [

                                              Container(
                                                height: 50,
                                                margin: const EdgeInsets.only(right: 5),
                                                alignment: Alignment.centerLeft,
                                                child: Obx(() => Text(
                                                  appController.productList.value[index]["price"] == null ? "price" : appController.productList.value[index]["price"].toString(),
                                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                ),
                                                ),
                                              ),

                                              Container(
                                                height: 50,
                                                margin: const EdgeInsets.only(left: 5),
                                                alignment: Alignment.centerLeft,
                                                child: Obx(() => Text(
                                                  appController.productList.value[index]["price"] == null ? "price 2" : appController.productList.value[index]["price"].toString(),
                                                  style: const TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough),
                                                ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Get.to(CategoriesPage());
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Container(
                      width: Common.mediaQueryWidth,
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget> [

                          SizedBox(
                            width: Common.halfWidth,
                            child: const Text(
                              "Popular Categories",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            width: Common.halfWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const <Widget> [

                                Icon(Icons.brightness_1, size: 10,),
                                SizedBox(width: 20,),
                                Icon(Icons.brightness_1, size: 10, color: Colors.grey,),
                                SizedBox(width: 20,),
                                Icon(Icons.brightness_1, size: 10, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    _popularCategoriesItem(),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      endDrawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: Drawer(
          child: _drawerHeader(),
        ),
      ),
    );
  }

  _drawerHeader() {
    return Card(
      color: Colors.amber,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Container(
        height: 200,
        color: Colors.blue,
      ),
    );
  }

  _dailyNeedsItem(){
    return Card(
      margin: const EdgeInsets.only(top: 20),
      elevation: 0,
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 260,
        width: Common.halfWidth + 70,
        color: Colors.grey[200],
        margin: const EdgeInsets.all(2),
        child: Column(
          children: <Widget> [

            Image.network("https://www.mobiledokan.com/wp-content/uploads/2022/02/Vivo-Y21T-image.jpg", width:100, height: 100,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [

                Container(
                  height: 50,
                  width: Common.halfWidth - 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(.20),
                      width: 1,
                    ),
                    color: Colors.blue.withOpacity(.10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget> [

                      Icon(Icons.shopping_cart, color: Colors.blue,),

                      Text("Add to cart", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),),

                    ],
                  ),
                ),

                Container(
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(.20),
                        width: 1,
                      ),
                      color: Colors.red.withOpacity(.10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(Icons.favorite_border, color: Colors.red,),
                    )
                ),

              ],
            ),

            Container(
              height: 50,
              width: 200,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Samesung A50, 8GB RAM, 256GB Rom, Silver color",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [

                Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "\$ 2541.88",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  height: 50,
                  margin: const EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "\$ 2514.10",
                    style: TextStyle(fontSize: 16, decoration: TextDecoration.lineThrough),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

  _popularCategoriesItem(){
    return Container(
      height: 150,
      width: 280,
      margin: const EdgeInsets.only(top: 10),
      child: Stack(
        children: <Widget> [

          Builder(builder: (context){
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://wallpaperaccess.com/full/2983394.jpg",
                width: 280, height: 150, fit: BoxFit.fill,
              ),
            );
          }),
          Positioned(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 10),
              child: const Text("Nature", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ),
        ],
      ),

    );
  }

}
