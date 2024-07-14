import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final int? maxlines;
  final int? maxLenght;

  final IconData? IconSuffix;
  final IconData? preFixICon;
  final TextInputType textInputType;

  const TextFormInputField(
      {Key? key,
      required this.controller,
      this.isPass = false,
      this.IconSuffix,
      this.preFixICon,
      this.maxLenght,
      this.maxlines,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boo = OutlineInputBorder(
        borderSide: BorderSide(
      color: Color(0xffF0F3F6),
    ));
    return Container(
      width: 343,
      height: 60,
      child: TextField(
        maxLines: maxlines,
        maxLength: maxLenght,
        decoration: InputDecoration(
          suffixIcon: Icon(
            IconSuffix,
            color: Color(0xffADB3BC),
          ),
          prefixIcon: Icon(
            preFixICon,
            color: Color(0xffADB3BC),
          ),
          enabledBorder: boo,
          focusedBorder: boo,
          disabledBorder: boo,
          fillColor: Color(0xffF6F7F9),
          hintText: hintText,
          hintStyle: GoogleFonts.nunitoSans(fontSize: 16),
          border: InputBorder.none,
          filled: true,
          contentPadding: EdgeInsets.all(8),
        ),
        keyboardType: textInputType,
        controller: controller,
        obscureText: isPass,
      ),
    );
  }
}
