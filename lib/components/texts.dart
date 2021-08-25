import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UseTexts extends StatelessWidget {
  final String textName;
  final double fontSize;
  final Color textColor;
  const UseTexts({Key? key, required this.textName, required this.fontSize, required this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: GoogleFonts.quicksand(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
