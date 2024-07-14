import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:wholesalegrocery/screens/main/pages/brands.dart';
import 'package:wholesalegrocery/utils/color.dart';
import 'package:wholesalegrocery/widget/app_bar_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://img.freepik.com/free-vector/shopping-supermarket-cart-with-grocery-pictogram_1284-11697.jpg?w=740&t=st=1719402507~exp=1719403107~hmac=df3d1d14478646b89e15e699629109c4cf327f5c419a49e7b46871e05b2870d1',
    'https://img.freepik.com/free-photo/close-up-cute-korean-woman-eating-cabbage-diet-holding-lettuce-isolated-white-background_1258-169895.jpg?w=740&t=st=1719402531~exp=1719403131~hmac=c185d341a8ef74e32e92e6bbd93cfd107481fd28d229c913b9c97f71936be866',
    'https://img.freepik.com/free-vector/shopping-supermarket-cart-with-grocery-pictogram_1284-11697.jpg?w=740&t=st=1719402507~exp=1719403107~hmac=df3d1d14478646b89e15e699629109c4cf327f5c419a49e7b46871e05b2870d1',
    'https://img.freepik.com/free-photo/close-up-cute-korean-woman-eating-cabbage-diet-holding-lettuce-isolated-white-background_1258-169895.jpg?w=740&t=st=1719402531~exp=1719403131~hmac=c185d341a8ef74e32e92e6bbd93cfd107481fd28d229c913b9c97f71936be866',
  ];

  int _current = 0; // Track current image index

  void shareInviteLink(BuildContext context) {
    // Replace 'YOUR_INVITE_LINK' with your actual invite link
    final String inviteLink = 'https://yourapp.com/invite?ref=friend123';

    Share.share(
      'Join our app using my invite link: $inviteLink',
      subject: 'Join us on the app!',
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hey,Guest User",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black45, // Outline border color
                        width: 1.0,
                      ),
                      borderRadius:
                          BorderRadius.circular(60.0), // Rounded corners
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (e) {},
                      decoration: InputDecoration(
                        hintText: "FC-Lahore (QIE)",
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        suffixIcon: Icon(
                          Icons.location_pin,
                          size: 12,
                        ), // Prefix icon
                        border: InputBorder.none, // Remove default border
                        contentPadding:
                            const EdgeInsets.only(top: 12.0, left: 10),
                      ),
                    ),
                  )),
              ListTile(
                leading: Icon(Icons.category, size: 20),
                title: Text(
                  "Categories",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_bag, size: 20),
                title: Text(
                  "My Cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person_pin_circle_rounded, size: 20),
                title: Text(
                  "My Profile",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard_customize, size: 20),
                title: Text(
                  "My Orders",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.cloud_done, size: 20),
                title: Text(
                  "GrocerClub",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.notifications, size: 20),
                title: Text(
                  "Promo Alerts",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.wine_bar, size: 20),
                title: Text(
                  "GrocerChamp",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                onTap: () {
                  shareInviteLink(context);
                },
                leading: Icon(Icons.share, size: 20),
                title: Text(
                  "Share",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.question_answer, size: 20),
                title: Text(
                  "FAQs",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.list, size: 20),
                title: Text(
                  "Wish List",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => Brands()));
                },
                leading: Icon(Icons.info, size: 20),
                title: Text(
                  "Brands",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help, size: 20),
                title: Text(
                  "Help Center",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              ListTile(
                leading: Icon(Icons.login, size: 20),
                title: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "English",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffee7e25)),

        // leading: IconButton(
        //     onPressed: () {}, icon: Icon(Icons.menu, color: Color(0xffee7e25))),
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
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("Deliver To "),
                        Text(
                          "FC-Lahore (QIE)",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
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
                      items: imgList
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
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color(0xffee7e25)
                                : Color.fromARGB(255, 160, 135, 115),
                          ),
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
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white30,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "assets/b.png",
                                    height: 80,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Soft Drinks",
                                      style: TextStyle(fontSize: 12),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "500ml",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "\$97",
                                        style: TextStyle(
                                            color: Color(0xffe5003a),
                                            fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "\$100",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
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
                                        color: Color(0xffe5003a),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "3% off",
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
}
