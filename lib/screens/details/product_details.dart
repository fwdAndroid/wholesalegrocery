import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wholesalegrocery/utils/color.dart';

class ProductDetails extends StatefulWidget {
  final discountPrice,
      category,
      productDescription,
      productImages,
      productName,
      productPrice,
      quantity,
      uuid,
      subCategory;
  const ProductDetails({
    super.key,
    required this.category,
    required this.discountPrice,
    required this.productDescription,
    required this.productImages,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.uuid,
    required this.subCategory,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
      body: Column(
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
                      "\$" + widget.productPrice.toString(),
                      style: GoogleFonts.poppins(
                          color: redColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "\$" + widget.discountPrice.toString(),
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
                            widget.discountPrice.toString() + "%off",
                            style: TextStyle(color: colorWhite, fontSize: 12),
                          ),
                        ))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: redColor,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
            ),
            child: Divider(
              color: decColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.category,
              style: GoogleFonts.poppins(fontSize: 18, color: maintColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.subCategory,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.productDescription,
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: Text(
                  "Add To Cart",
                  style: GoogleFonts.poppins(fontSize: 14, color: colorWhite),
                )),
          )
        ],
      ),
    );
  }
}
