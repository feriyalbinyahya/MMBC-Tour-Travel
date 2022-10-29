import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';

import '../utils/colors.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      title: Text(
        "MMBC TOUR & TRAVEL",
        style: GoogleFonts.openSans(textStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700
        )),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
          ),
          onPressed: () {
          },
        ),
      ],
    );
  }
}
