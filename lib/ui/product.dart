import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/CommonWdg.dart';

class ProductDetailsPage extends StatelessWidget {
  late final ScrollController _scrollViewController= ScrollController();

  @override
  Widget build(BuildContext context) {
    Common.dynamicScreenSize(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, size: 20, color: Colors.black,),
        title: Container(
          width: Common.mainContainerHeight - 10,
          alignment: Alignment.center,
          child: const Text(
            "XE",
            style: TextStyle(fontSize: 25, color: Colors.black),
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
                      child: const Icon(Icons.favorite, color: Colors.red,),
                    ),
                    /*onTap: (){
                      _scaffoldKey.currentState?.openEndDrawer();
                    },*/
                  ),
                ),
              )

            ],
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          Builder(builder: (context){
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: Container(
                  margin: EdgeInsets.zero,
                  //padding: const EdgeInsets.only(left: 7, right: 7 ,bottom: 7),
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: <Widget> [

                          Container(
                            width: Common.mainContainerWidth,
                            alignment: Alignment.center,
                            child: Container(
                              height: 30,
                              width: 40,
                              margin: const EdgeInsets.only(left: 5, top: 30),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withOpacity(.20),
                                  width: 1,
                                ),
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Text(
                                "30 %",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 250,
                            margin: const EdgeInsets.only(top: 30),
                            child: const CircleAvatar(
                              radius: 130, // Image radius
                              backgroundImage: NetworkImage("http://pngbackground.com/public/uploads/preview/forest-picsart-cb-background-download-free-for-snapseed-11633511771qjwtrdqe8h.jpg"),
                            ),
                          ),

                          Card(
                            margin: const EdgeInsets.only(top: 20),
                            elevation: 0,
                            color: Colors.grey.withOpacity(0.10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                            ),
                            child: Column(
                              children: <Widget> [

                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [

                                      const Text(
                                        "Nick Air Max 200",
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),

                                      Row(
                                        children: const <Widget> [

                                          Icon(Icons.star, size: 20,),

                                          Text(
                                            "(4.5)",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: const Text(
                                    "Build for natural motion the nick. Flax show",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20,),

                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [

                                      const Text(
                                        "Size : ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue,
                                            width: 1,
                                          ),
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          "US 6",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.grey.withOpacity(.10),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          "US 7",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.grey.withOpacity(.10),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          "US 8",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 45,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.grey.withOpacity(.10),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          "US 9",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20,),

                                Container(
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [

                                      const Text(
                                        "Available Color ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.amber,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.deepPurpleAccent,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),

                                      Container(
                                        height: 30,
                                        width: 30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(.10),
                                            width: 1,
                                          ),
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }), Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomNavigationBar(),
          ),
        ],
      ),

    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [

          Container(
            margin: const EdgeInsets.only(left: 10),
            child: const Text(
              "\$ 2500.20",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Container(
            height: 50,
            width: 150,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(.10),
                width: 1,
              ),
              color: Colors.grey.withOpacity(.10),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget> [

                Icon(Icons.shopping_cart, size: 20,),
                SizedBox(width: 10,),
                Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
