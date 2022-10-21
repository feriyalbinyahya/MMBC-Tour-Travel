import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class FlightClassIcon extends StatelessWidget {
  FlightClassIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage("assets/images/flight_class.png"));
  }
}