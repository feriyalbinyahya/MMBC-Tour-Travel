import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';

import '../routes/route_helper.dart';

class IconTextBottom extends StatelessWidget {
  final Widget icon;
  final String text;
  final Color color;
  final String routeHelper;
  IconTextBottom({Key? key, required this.icon, required this.text, this.color= const Color(0xff445870), this.routeHelper = RouteHelper.initial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(routeHelper);
      },
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
