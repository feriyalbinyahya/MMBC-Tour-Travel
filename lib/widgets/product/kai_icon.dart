import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class KAIIcon extends StatelessWidget {
  KAIIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FineIcons(
      background: Color(0xFF3A66DB),
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
        image: "assets/images/logo-kai-white.png",
      ),
    );
  }
}