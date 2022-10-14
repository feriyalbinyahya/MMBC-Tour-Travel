import 'package:flutter/material.dart';
import 'package:fine_icons/fine_icons.dart';

class IconImage extends StatelessWidget {
  Color? color;
  double widthImg;
  double heightImg;
  double widthCard;
  double heightCard;
  final String pathImage;
  IconImage({Key? key, this.color = const Color(0xFF000000),
    required this.pathImage, this.widthCard=25, this.heightCard=25, this.widthImg=14,
    this.heightImg=14}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FineIcons(
      background: color,
      allSideRadius: 8,
      width: widthCard,
      minHeight: heightCard,
      elevation: 0,
      elevationShadowColor: Colors.white,
      cardImage: CardImage(
        padding: 5,
        width: widthImg,
        height: heightImg,
        imageType: ImageType.assetImage,
        image: pathImage,
      ),
    );
  }
}