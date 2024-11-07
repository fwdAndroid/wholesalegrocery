import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'package:wholesalegrocery/screens/home_screen.dart';
import 'package:wholesalegrocery/utils/color.dart';

class ProductCart extends StatefulWidget {
  final discountPrice, productPrice;
  final String category,
      productDescription,
      productImages,
      productName,
      uuid,
      subCategory;
  final String quantity;

  const ProductCart({
    super.key,
    required this.category,
    required this.discountPrice,
    required this.productDescription,
    required this.productImages,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.subCategory,
    required this.uuid,
  });

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = int.parse(widget.quantity);
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  double get totalPrice {
    double price = double.parse(widget.productPrice) * quantity;
    double discountAmount = double.parse(widget.discountPrice) / 100 * price;
    return price - discountAmount;
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: maintColor),
        title: Text(widget.productName),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share, color: maintColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: maintColor),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.badge, color: maintColor),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("clients")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text(""));
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }
          var snap = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.productName,
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  widget.productImages,
                  height: 150,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$${widget.productPrice.toString()}",
                          style: GoogleFonts.poppins(
                              color: redColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "\$${widget.discountPrice.toString()}",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: decColor,
                              fontSize: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: redColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "${widget.discountPrice.toString()}% off",
                              style: TextStyle(color: colorWhite, fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border, color: redColor))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity:",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: decrementQuantity,
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          '$quantity',
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: incrementQuantity,
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Total Price: \$${totalPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Other UI elements for product details go here...
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location :",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      snap['location'],
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        fixedSize: Size(MediaQuery.of(context).size.width, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      var uuid = Uuid().v4();
                      await FirebaseFirestore.instance
                          .collection("orders")
                          .doc(uuid)
                          .set({
                        "uuid": uuid,
                        "productDescription": widget.productDescription,
                        "price": totalPrice,
                        "status": "order",
                        "location": snap['location'],
                        "quantity": quantity,
                        "productCategory": widget.category,
                        "productName": widget.productName,
                        "productImages": widget.productImages.toString()
                      });
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Order is Placed")));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => HomeScreen()));
                    },
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "Book Now",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: colorWhite),
                          )),
              )
            ],
          );
        },
      ),
    );
  }
}
