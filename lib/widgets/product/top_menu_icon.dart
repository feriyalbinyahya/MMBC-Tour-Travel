import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class TopMenuIcon extends StatelessWidget {
  TopMenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(width: 30 , height: 30, image: AssetImage("assets/images/circled-menu-white.png"));
  }
}