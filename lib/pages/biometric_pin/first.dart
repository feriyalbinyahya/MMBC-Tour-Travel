import '../../helper/biometric_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/controllers/homepage/recommended_hotel_controller.dart';
import 'package:mmbc_tour_and_travel/helper/biometric_helper.dart';
import 'package:mmbc_tour_and_travel/pages/biometric_pin/passcod.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isNewUser = true;
  final authService = BiometricHelper();

  @override
  void initState() {
    super.initState();
    initialization();
    getUserStatus();
  }

  Future<void> getUserStatus() async {
    final val = await authService.read('pin');
    if (val.isNotEmpty){
      setState(() {
        isNewUser = false;
      });
    }
    authService.isNewUserController.add(isNewUser);
  }

  void initialization() async {
    Future.delayed(Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: authService.read('pin'),
      builder: (context, snapshot){
        print(snapshot.data);
        if(snapshot.connectionState == ConnectionState.waiting){
          print("sempet muter");
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        if(snapshot.hasData && snapshot.data!.isNotEmpty){
          return PasscodePage();
        }
        print("habis itu sini");
        return PasscodePage();
      },
    );
  }
}
