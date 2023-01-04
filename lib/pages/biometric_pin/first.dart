import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mmbc_tour_and_travel/pages/biometric_pin/passcod.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';

import '../../helper/biometric_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../home/main_home_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool showBiometric = false;
  bool isAuthenticated = false;
  @override
  void initState() {
    initialization();
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    print(showBiometric);
    setState(() {});
  }

  void initialization() async {
    Future.delayed(Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  @override
  Widget build(BuildContext context) {
    return PasscodePage(showBiometric);
    /**
    if(isAuthenticated){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
            (Route<dynamic> route) => false,
      );
    }
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometric)
              ElevatedButton(
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  isAuthenticated = await BiometricHelper().authenticate();
                  setState(() {});
                },
              ),
            ElevatedButton(
              child: const Text(
                'Using PIN code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () async {
                Get.toNamed(RouteHelper.passcode);
              },
            ),
            if (isAuthenticated)
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Well done!, Authenticated',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
          ],
        ),
      ),
    );
     **/
  }
}
