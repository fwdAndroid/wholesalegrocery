import 'package:flutter/material.dart';
import 'package:wholesalegrocery/services/firebase_services.dart';
import 'package:wholesalegrocery/utils/color.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  List<Map<String, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    loadBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 20,
        iconTheme: IconThemeData(color: maintColor),
        title: Text(
          "Brands",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: GridView.builder(
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (context, index) {
            var product = productList[index];
            return Container(
              color: Colors.white30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        product['image'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          product['brandName'],
                          style: TextStyle(fontSize: 12),
                        )),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> loadBrands() async {
    FirebaseServices firebaseServices = FirebaseServices();
    List<Map<String, dynamic>> products = await firebaseServices.fetchBrands();
    setState(() {
      productList = products;
    });
  }
}
