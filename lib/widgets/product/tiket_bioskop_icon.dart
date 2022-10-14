import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class TiketBioskopIcon extends StatelessWidget {
  TiketBioskopIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FineIcons(
      background: Color(0xFF414141),
      allSideRadius: 12,
      width: 35,
      minHeight: 35,
      elevationShadowColor: Colors.white,
      elevation: 0,
      cardImage: CardImage(
        padding: 5,
        width: 20,
        height: 20,
        imageType: ImageType.assetImage,
        image: "assets/images/clapperboard-white.png",
      ),
    );
  }
}