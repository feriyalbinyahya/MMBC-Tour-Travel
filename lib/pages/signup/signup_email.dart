import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/base/show_custom_snackbar.dart';
import 'package:mmbc_tour_and_travel/widgets/big_text.dart';
import 'package:mmbc_tour_and_travel/widgets/product/top_menu_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/small_text.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({Key? key}) : super(key: key);

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    void _registrationEmail(){
      String email = emailController.text.trim();

      if(email.isEmpty){
        showCustomSnackBar("Type in your email address", title: "email");
      }else if(!GetUtils.isEmail(email)){
        showCustomSnackBar("Type in a valid email address", title: "Valid email address");
      }else{
        showCustomSnackBar("Email is OK", title: "Perfect");
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MyAppBar(titlePage: "Daftar Akun Baru"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: GestureDetector(
            onTap: (){
              _registrationEmail();
            },
            child: Container(),
          ),
        ),
      ),
    );
  }
}
