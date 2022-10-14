import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';

class IconTextBottom extends StatelessWidget {
  final Widget icon;
  final String text;
  const IconTextBottom({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 5,),
          SmallText(text: text, size:10, height: 1,)
        ],
      ),
    );
  }
}
