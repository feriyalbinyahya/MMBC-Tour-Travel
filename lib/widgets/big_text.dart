import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  FontWeight weight;
  BigText({Key? key, this.color = const Color(0xFF000000),
    required this.text, this.size=20, this.height=1.2, this.weight=FontWeight.w400}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.openSans(textStyle: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        height: height,
      ),)
    );
  }
}
