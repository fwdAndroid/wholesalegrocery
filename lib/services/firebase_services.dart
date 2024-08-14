import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  //Brands
  Future<List<Map<String, dynamic>>> fetchBrands() async {
    List<Map<String, dynamic>> products = [];
    await FirebaseFirestore.instance
        .collection('brands')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        products.add(doc.data());
      });
    });
    return products;
  }

  //SignIn Method
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
