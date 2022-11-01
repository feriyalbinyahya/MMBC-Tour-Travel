import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MyAppBar(titlePage: "Daftar Akun Baru"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: BigText(text: "Registrasi"),
              ),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          spreadRadius: 5,
                          offset: Offset(1, 6),
                          color: Colors.grey.withOpacity(0.2)
                      )
                    ]
                ),
                padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [

                    SizedBox(height: 30,),

                    SizedBox(height: 20,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          SmallText(text: "Show password")
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        print("login");
                      },
                      child: Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: AppColors.mainColor
                        ),
                        child: Center(
                          child: BigText(text: "Log In", color: Colors.white, size: 13, weight: FontWeight.bold,),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){},
                      child: SmallText(text: "Lupa Password?", color: AppColors.mainColor, weight: FontWeight.bold,),
                    ),
                    SizedBox(height: 20,),
                    Stack(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 5),
                            child: const Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0.8,
                              indent: 20,
                              endIndent: 20,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 132),
                          width: 50,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Center(
                            child: SmallText(text: "atau", color: Colors.grey, size: 11),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    RichText(
                      text: TextSpan(
                        text: "Belum punya akun?",
                        style: GoogleFonts.openSans(textStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                        children: [
                          TextSpan(
                              text: " Daftar",
                              style: GoogleFonts.openSans(textStyle: TextStyle(color: AppColors.mainColor, fontSize: 12, fontWeight: FontWeight.bold))
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
