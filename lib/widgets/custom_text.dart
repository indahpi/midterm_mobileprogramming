import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// pemilihan font 'arimo' karena font terlihat rapi, bersih, dan 
// sangat mudah dibaca pengguna di aplikasi kantin kita 
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.color,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.arimo(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black87,
      ),
    );
  }
}