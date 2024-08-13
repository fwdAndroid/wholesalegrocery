import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wholesalegrocery/services/firebase_services.dart';
import 'package:wholesalegrocery/utils/color.dart';
import 'package:wholesalegrocery/widget/app_bar_textfield.dart';
import 'package:wholesalegrocery/widget/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageUrls = [];
  int _current = 0; // Track current image index
  List<Map<String, dynamic>> productList = [];
  @override
  void initState() {
    super.initState();
    loadImages();
    loadProducts();
  }

  Future<void> loadImages() async {
    FirebaseServices firebaseServices = FirebaseServices();
    List<String> urls = await firebaseServices.loadImages();
    setState(() {
      imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffee7e25)),
        title: AppBarTextField(
          hintText: 'What are you looking for?',
          prefixIcon: Icons.search,
          controller: _searchController,
          onChanged: (value) {
            // Handle search query here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_bag, color: Color(0xffee7e25)),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: textColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Deliver To "),
                        Text(
                          "FC-Lahore (QIE)",
                          style: TextStyle(
                              color: textColor, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: textColor,
                    )
                  ],
                ),
              ),
              // Add a SizedBox for spacing between the previous elements and carousel
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: imageUrls
                          .map((item) => Container(
                                child: Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(
                                            item,
                                            fit: BoxFit.cover,
                                            width: 1000.0,
                                          ),
                                        ],
                                      )),
                                ),
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 10), // Add spacing

                    // Custom Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageUrls.map((url) {
                        int index = imageUrls.indexOf(url);
                        return Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? maintColor
                                  : noactiveColor),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  child: GridView.builder(
                      itemCount: productList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) {
                        var product = productList[index];
                        return Container(
                          color: Colors.white30,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    product['productImages'],
                                    height: 80,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      product['productName'],
                                      style: TextStyle(fontSize: 12),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    product['quantity'].toString(),
                                    style: TextStyle(
                                        color: textColor, fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$" +
                                            product['productPrice'].toString(),
                                        style: TextStyle(
                                            color: redColor, fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\$" +
                                            product['discountPrice'].toString(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: decColor,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: redColor,
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        product['discountPrice'].toString() +
                                            "%off",
                                        style: TextStyle(
                                            color: colorWhite, fontSize: 12),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadProducts() async {
    FirebaseServices firebaseServices = FirebaseServices();
    List<Map<String, dynamic>> products =
        await firebaseServices.fetchProducts();
    setState(() {
      productList = products;
    });
  }
}
