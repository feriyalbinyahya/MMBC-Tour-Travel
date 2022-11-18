import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/controllers/auth/auth_controller.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/widgets/big_text.dart';
import 'package:mmbc_tour_and_travel/widgets/product/top_menu_icon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../base/show_custom_snackbar.dart';
import '../../utils/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitCircle(
      color: AppColors.mainColor,
      size: 50.0,
    );
    void _login(AuthController authController){
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();

      if(username.isEmpty){
        showCustomSnackBar("Type in your email address", title: "email");
      }else if(!GetUtils.isEmail(username)){
        showCustomSnackBar("Type in a valid username", title: "Valid username");
      }else if(password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "password");
      }else if(password.length<6){
        showCustomSnackBar("Password can not be less than six characters", title: "Password length");
      }else{
        authController.login(username, password).then((status){
          if(status.isSuccess){
            print("Success login");
            Get.toNamed(RouteHelper.initial);
          }else{
            showCustomSnackBar(status.message);
          }
        });
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MyAppBar(titlePage: "Login"),
      ),
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoadingLogin? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: BigText(text: "Login"),
                    padding: EdgeInsets.only(left: 20, top: 20),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 20),
                  child: Column(
                    children: [
                      TextField(
                        style: GoogleFonts.openSans(textStyle: TextStyle(
                            fontSize: 14
                        )),
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.person, color: AppColors.mainColor,),

                        ),
                      ),
                      SizedBox(height: 30,),
                      TextField(
                        obscureText: !isShowPassword,
                        style: GoogleFonts.openSans(textStyle: TextStyle(
                            fontSize: 14
                        )),
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: "password",
                            prefixIcon: Icon(Icons.key_rounded, color: AppColors.mainColor,),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 30,
                              height: 24,
                              child: Transform.scale(
                                scale: 0.8,
                                child: Checkbox(
                                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  value: isShowPassword,
                                  checkColor: Colors.white,
                                  activeColor: AppColors.mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  onChanged: (isChecked) {
                                    setState(() {
                                      isShowPassword = !isShowPassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SmallText(text: "Show password")
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          _login(authController);
                        },
                        child: Container(
                          width: 350,
                          height: 35,
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
                            margin: EdgeInsets.only(left: 136),
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
        ): spinkit;
      }),
    );
  }
}
