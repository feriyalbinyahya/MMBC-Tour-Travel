import 'package:flutter/material.dart';

class DotCircle extends StatelessWidget {
  Color? color;
  double height;
  double width;
  double mtop, mbottom, mright, mleft;
  DotCircle({Key? key, this.color= const Color(0xFF000000),
    this.height = 3, this.width = 3, this.mtop = 0, this.mbottom = 0,
    this.mleft = 0, this.mright = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 3,
      margin: EdgeInsets.only(top:mtop, bottom: mbottom,right: mright, left: mleft),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
