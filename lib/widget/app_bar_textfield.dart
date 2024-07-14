import 'package:flutter/material.dart';

class AppBarTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final Function(String) onChanged;

  const AppBarTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45, // Outline border color
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(60.0), // Rounded corners
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
          prefixIcon: Icon(
            prefixIcon,
            size: 12,
          ), // Prefix icon
          border: InputBorder.none, // Remove default border
          contentPadding: const EdgeInsets.only(top: 12.0),
        ),
      ),
    );
  }
}
