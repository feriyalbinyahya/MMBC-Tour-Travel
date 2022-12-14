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

import '../../controllers/auth/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/big_text.dart';
import '../../widgets/home_app_bar.dart';
import '../../widgets/product/bus_travel_icon.dart';
import '../../widgets/product/flight_class_icon.dart';
import '../../widgets/product/gopay_icon.dart';
import '../../widgets/product/hotel_icon.dart';
import '../../widgets/product/kai_icon.dart';
import '../../widgets/product/lainnya_icon.dart';
import '../../widgets/product/pelni_icon.dart';
import '../../widgets/product/pln_icon.dart';
import '../../widgets/small_text.dart';
import '../home/hotel_banner.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> iconMainMenu = [FlightIcon(), FlightClassIcon(),
      KAIIcon(), HotelIcon(), PELNIIcon(),
      KapalFerryIcon(), BusTravelIcon(), BusAKAPIcon(), PLNIcon(),
      GopayIcon(), IsiPulsaIcon(), TransferUangIcon(), TiketBioskopIcon(),
      KirimPaketIcon(), LainnyaIcon()];

    List<String> titleIconMainMenu = ["Flight", "Flight Class", "Kereta Api",
      "Hotel", "PELNI", "Kapal Ferry", "Bus Travel", "Bus AKAP", "PLN", "GOPAY",
      "Isi Pulsa", "Transfer Uang", "Tiket Bioskop", "Kirim Paket", "Lainnya"];

    List<String> routeIconMainMenu = [RouteHelper.flightForm, "Flight Class", "Kereta Api",
      "Hotel", "PELNI", "Kapal Ferry", "Bus Travel", "Bus AKAP", "PLN", "GOPAY",
      "Isi Pulsa", "Transfer Uang", "Tiket Bioskop", "Kirim Paket", "Lainnya"];

    return GetBuilder<AuthController>(builder: (authController){
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top:0, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: !authController.userLoggedIn()?Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffeeeeee),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffd2d2d2),
                        blurRadius: 1,
                        spreadRadius: 0.05,
                        // offset to act as bottom border color
                        offset: Offset(0.5, 0.8),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RouteHelper.login);
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SmallText(text: "Masuk atau Daftar", size: 14, height: 1.5, color: Color(0xFF5b5b5b),),
                              SmallText(text: "Untung lebih banyak sebagai member!", size: 10 , height: 1.5, color: Color(0xFF5b5b5b),),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15,),
                        const CircleAvatar(
                          backgroundColor: Color(0xff626262),
                          radius: 15,
                          child: Icon(
                            Icons.person,
                            color: Color(0xffF9F9F9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ):null
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                  crossAxisCount: 5 ,
                  children: List.generate(15,(index){
                    return Container(
                        child: IconTextBottom(icon: iconMainMenu[index], text: titleIconMainMenu[index], routeHelper: routeIconMainMenu[index],)
                    );
                  }),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Hotel keren untuk bobok cantik", size: 16, weight: FontWeight.w600,),
                    SizedBox(height: 10,),
                    SmallText(text: "Tidur makin pules dan mimpi indah"),
                  ],
                ),
              ),
              HotelSectionView(),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Kamu pasti menyukai ini", size: 16 ,weight: FontWeight.w600,),
                    SizedBox(height: 10,),
                    SmallText(text: "Banjir cashback dan info menarik!"),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              PromoSectionView(),
            ],
          ),
        ),
      );
    },);
  }
}
