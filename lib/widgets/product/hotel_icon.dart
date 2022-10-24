import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class HotelIcon extends StatelessWidget {
  HotelIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(width: 40 , height: 40, image: AssetImage("assets/images/hotel.png"));
  }
}