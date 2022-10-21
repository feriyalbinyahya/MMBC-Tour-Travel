import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class PELNIIcon extends StatelessWidget {
  PELNIIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FineIcons(
      background: Color(0xFFEF4E4E),
      allSideRadius: 13,
      width: 35,
      minHeight: 35,
      elevationShadowColor: Colors.white,
      elevation: 0,
      cardImage: CardImage(
        padding: 5,
        width: 20,
        height: 20,
        imageType: ImageType.assetImage,
        image: "assets/images/logo-pelni-white.png",
      ),
    );
  }
}