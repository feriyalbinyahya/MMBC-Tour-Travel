import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';
import 'package:mmbc_tour_and_travel/pages/navbar_screen/homepage_screen.dart';

import '../../helper/biometric_helper.dart';
import '../../widgets/local_auth/gradientwrapper.dart';
import '../../widgets/local_auth/passcode.dart';

class PasscodePage extends StatefulWidget {
  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  late Stream<bool> _isVerification;
  late Future<bool> hasBio;
  int attempts = 0;

  @override
  void initState() {
    authService.isEnabledStream;
    this._isVerification = authService.isEnabledStream;
    super.initState();
  }

  void _onCallback(String enteredCode) {
    authService.verifyCode(enteredCode);
    this._isVerification.listen((isValid) {
      if (isValid) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePageScreen()));
      } else {
        setState(() => attempts += 1);
        if (attempts == 5) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    });
  }

  void _onCancel() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Future<void> authenticate() async {
    final isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Do something',
      options: AuthenticationOptions(biometricOnly: true)
        );
    authService.isEnabledController.add(isAuthenticated);
    if (isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePageScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: localAuth.canCheckBiometrics,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            print(snapshot.data);
            this.authenticate();
            return GradientWrapper(
              child: Container(
                child: Text(
                  'Please Authenticate',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 75.0),
              ),
            );
          }
          return PasscodeWidget(
            _isVerification,
            _onCallback,
            _onCancel,
          );
        });
  }
}