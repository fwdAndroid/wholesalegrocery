import 'package:flutter/material.dart';
import 'package:wholesalegrocery/screens/auth/google_screen.dart';
import 'package:wholesalegrocery/screens/home_screen.dart';
import 'package:wholesalegrocery/utils/color.dart';
import 'package:wholesalegrocery/widget/socail_button.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Text(
              "Lets get connected",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "Easy & safe way to connect",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w200, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/icon.png",
            height: 180,
            width: 150,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
          Center(
            child: Text(
              "Create an account or login to the app",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.w200, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SaveButton(
              title: "Continue via Google",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => GoogleAuth()));
              }),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => HomeScreen()));
            },
            child: Center(
              child: Text(
                "Continue",
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w200,
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
