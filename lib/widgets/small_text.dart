import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight weight;
  SmallText({Key? key, this.color = const Color(0xFF000000),
    required this.text, this.size=12, this.height=1.2, this.weight=FontWeight.w400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(textStyle: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        fontWeight: weight,
      ),)
    );
  }
}