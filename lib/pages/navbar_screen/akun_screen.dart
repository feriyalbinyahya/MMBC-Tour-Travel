import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.takepicture);
            },
            child: Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Akun Page"),
            ),
          )),
    );
  }
}