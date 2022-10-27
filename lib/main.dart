import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/controllers/homepage/recommended_hotel_controller.dart';

import 'controllers/homepage/recommended_promo_controller.dart';
import 'home/main_home_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dep.init();
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
      ),
      home: MainPage(),
    );
  }
}
