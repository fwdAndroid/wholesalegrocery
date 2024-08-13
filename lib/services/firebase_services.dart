import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  Future<List<String>> loadImages() async {
    List<String> urls = await fetchImageUrls();
    return urls;
  }

  Future<List<String>> fetchImageUrls() async {
    List<String> imageUrls = [];
    await FirebaseFirestore.instance
        .collection('promotionsImages')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        imageUrls.add(doc['image']);
      });
    });
    return imageUrls;
  }

  //Products
  Future<List<Map<String, dynamic>>> fetchProducts() async {
    List<Map<String, dynamic>> products = [];
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        products.add(doc.data());
      });
    });
    return products;
  }
}
