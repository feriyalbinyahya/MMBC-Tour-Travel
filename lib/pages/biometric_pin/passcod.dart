import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';
import 'package:mmbc_tour_and_travel/pages/navbar_screen/homepage_screen.dart';

import '../../helper/biometric_helper.dart';
import '../../routes/route_helper.dart';
import '../../widgets/local_auth/gradientwrapper.dart';
import '../../widgets/local_auth/passcode.dart';
import '../home/main_home_page.dart';

class PasscodePage extends StatefulWidget {
  final bool showBio;
  PasscodePage(this.showBio);

  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  late Stream<bool> _isVerification;
  late Future<bool> hasBio;
  bool isAuthenticated = false;
  int attempts = 0;

  @override
  void initState() {
    authService.isEnabledStream;
    this._isVerification = authService.isEnabledStream;
    isBiomAvailable();
    super.initState();
  }

  isBiomAvailable() async {
    if(widget.showBio){
      isAuthenticated = await BiometricHelper().authenticate();
      setState(() {});
    }
  }

  void _onCallback(String enteredCode) {
    authService.verifyCode(enteredCode);
    this._isVerification.listen((isValid) {
      if (isValid) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
              (Route<dynamic> route) => false,
        );
      } else {
        setState(() => attempts += 1);
        if (attempts == 5) {
          Get.toNamed(RouteHelper.login);
        }
      }
    });
  }

  void _onCancel() async {
    isAuthenticated = await BiometricHelper().authenticate();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    if(isAuthenticated){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
            (Route<dynamic> route) => false,
      );
    }
    return PasscodeWidget(
      _isVerification,
      _onCallback,
      _onCancel,
    );
  }
}