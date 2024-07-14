import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wholesalegrocery/utils/color.dart';

class SaveButton extends StatelessWidget {
  String title;
  final void Function()? onTap;

  SaveButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(280, 50),
          backgroundColor: Color(0xffee7e25),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      child: Text(
        title,
        style: GoogleFonts.manrope(
            fontSize: 14, fontWeight: FontWeight.w500, color: colorWhite),
      ),
    );
  }
}
