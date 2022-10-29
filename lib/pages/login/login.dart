import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/widgets/big_text.dart';

import '../../utils/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/small_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var usernameController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Container(
          child: Column(
            children: [
              MyAppBar(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                ),
                padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 10),
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 250,),
                      SmallText(text: "Top Menu", color: Colors.white,),
                      SizedBox(width: 10,),
                      Icon(Icons.menu, color: Colors.white,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: BigText(text: "Login"),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person, color: AppColors.mainColor,),

                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(Icons.key_rounded, color: AppColors.mainColor,)
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: 350,
        child: MyDrawer(),
      ),
    );
  }
}
