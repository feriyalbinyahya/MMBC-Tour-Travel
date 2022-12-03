import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../widgets/small_text.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.takepicture);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                      color: Colors.blue
                  ),
                  child: Text("Ambil gambar", style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.invoiceList);
                },
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue
                  ),
                  child: Text("Cetak struk", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                ),
              )
            ],
          )
      ),
    );
  }
}