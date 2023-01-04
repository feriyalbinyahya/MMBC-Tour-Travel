import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/pages/home/promo_banner.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';
import 'package:mmbc_tour_and_travel/widgets/app_bar.dart';
import 'package:mmbc_tour_and_travel/widgets/drawer.dart';
import 'package:mmbc_tour_and_travel/widgets/icon_text_bottom.dart';
import 'package:mmbc_tour_and_travel/widgets/product/bus_akap_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/flight_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/isi_pulsa_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/kapal_ferry_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/kirim_paket_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/tiket_bioskop_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/transfer_uang_icon.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../../helper/biometric_helper.dart';
import '../../services/local_notification_service.dart';
import '../../widgets/home_app_bar.dart';
import '../navbar_screen/akun_screen.dart';
import '../navbar_screen/bantuan_screen.dart';
import '../navbar_screen/homepage_screen.dart';
import '../navbar_screen/notifikasi_screen.dart';
import '../navbar_screen/pesanan_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  LocalNotificationService service = LocalNotificationService();
  String? mtoken = " ";

  bool showBiometric = false;
  bool isAuthenticated = false;


  @override
  void initState() {
    super.initState();
    initialization();
    requestPermission();

    getToken();
    service.initialize();
    isBiometricsAvailable();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }

  void initialization() async {
    Future.delayed(Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging =  FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      carPlay: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission!");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("User granted provisional permission");
    }else{
      print("User declined or has not accepted permission");
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mtoken = token;
        print("My token is $mtoken");
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    String? uniqueID = await PlatformDeviceId.getDeviceId;
    print(uniqueID);
    await FirebaseFirestore.instance.collection("UserTokens").doc(uniqueID).set({
      'token':token,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          child: Column(
            children: [
              HomeAppBar(service: service),
            ],
          ),
        ),
      ),
      body: PersistentTabView(
        context,
        hideNavigationBarWhenKeyboardShows: true,
        screens: screens(),
        items: navBarItems(),
        navBarStyle: NavBarStyle.style3,
      ),
      drawer: Drawer(
        width: 350,
        child: MyDrawer(),
      ),
    );
  }

  List<Widget> screens() {
    return [
      HomePageScreen(),
      PesananScreen(),
      NotifikasiScreen(),
      BantuanScreen(),
      AkunScreen(),

    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Beranda",
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: AppColors.mainColor
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.assignment),
          title: "Pesanan",
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.mainColor
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications_active),
          title: "Notifikasi",
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.mainColor
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.contact_support),
          title: "Bantuan",
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.mainColor
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: "Akun",
          activeColorPrimary: AppColors.mainColor,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: AppColors.mainColor
      ),
    ];
  }
}



