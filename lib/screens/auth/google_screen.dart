import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:wholesalegrocery/screens/auth/google_map_activity.dart';
import 'package:wholesalegrocery/screens/home_screen.dart';
import 'package:wholesalegrocery/services/firebase_services.dart';
import 'package:wholesalegrocery/utils/color.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  bool isGoogle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          isGoogle
              ? Center(
                  child: CircularProgressIndicator(
                  color: maintColor,
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SocialLoginButton(
                    backgroundColor: Colors.white,
                    borderRadius: 50,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () async {
                      FirebaseServices().signInWithGoogle().then((value) async {
                        setState(() {
                          isGoogle = true;
                        });
                        User? user = FirebaseAuth.instance.currentUser;

                        // Check if user data exists in Firestore
                        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
                            await FirebaseFirestore.instance
                                .collection("clients")
                                .doc(user?.uid)
                                .get();

                        // If user data doesn't exist, store it
                        if (!userSnapshot.exists) {
                          // If user is not null and phone number is available, use it. Otherwise, use a default text.
                          String contactNumber =
                              user?.phoneNumber ?? "No Number Available";

                          // Set user data in Firestore
                          await FirebaseFirestore.instance
                              .collection("clients")
                              .doc(user?.uid)
                              .set({
                            "photoURL": user?.photoURL?.toString(),
                            "email": user?.email,
                            "isblocked": false,
                            "location": "No Location Selected",
                            "fullName": user?.displayName,
                            "contactNumber": contactNumber,
                            "uid": user?.uid,
                            "password": "Auto Take Password",
                            "confirmPassword": "Auto Take Password",
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) =>
                                      GoogleMapSignInActivity()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => HomeScreen()));
                        }

                        setState(() {
                          isGoogle = false;
                        });
                      });
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
