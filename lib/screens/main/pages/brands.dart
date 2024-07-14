import 'package:flutter/material.dart';
import 'package:wholesalegrocery/utils/color.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 20,
        iconTheme: IconThemeData(color: Color(0xffee7e25)),

        // leading: IconButton(
        //     onPressed: () {}, icon: Icon(Icons.menu, color: Color(0xffee7e25))),
        title: Text(
          "Brands",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/b.png",
                      height: 100,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Pepsi",
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
