import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';

class IconTextBottom extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color color;
  const IconTextBottom({Key? key, required this.icon, required this.text, this.color= const Color(0xff445870)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 5,),
          SmallText(text: text, size:9, height: 1, color: color,)
        ],
      ),
    );
  }
}
