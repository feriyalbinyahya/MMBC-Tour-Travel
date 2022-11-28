import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/controllers/homepage/recommended_hotel_controller.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';

import 'controllers/homepage/recommended_promo_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'helper/dependencies.dart' as dep;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dep.init();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<RecommendedHotelController>().getRecommendedHotelList();
    Get.find<RecommendedPromoController>().getRecommendedPromoList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle( //<-- SEE HERE
            // Status bar color
            statusBarColor: AppColors.mainColor,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: MainPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
