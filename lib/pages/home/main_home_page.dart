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

import '../../routes/route_helper.dart';
import '../../widgets/big_text.dart';
import '../../widgets/product/bus_travel_icon.dart';
import '../../widgets/product/flight_class_icon.dart';
import '../../widgets/product/gopay_icon.dart';
import '../../widgets/product/hotel_icon.dart';
import '../../widgets/product/kai_icon.dart';
import '../../widgets/product/lainnya_icon.dart';
import '../../widgets/product/pelni_icon.dart';
import '../../widgets/product/pln_icon.dart';
import '../../widgets/small_text.dart';
import 'hotel_banner.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    Future.delayed(Duration(seconds: 3)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }
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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: Container(
          child: Column(
            children: [
              MyAppBar(),
              Container(
                padding: EdgeInsets.only(top: 15, right: 20, left: 20),
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
                            SmallText(text: "Masuk atau Daftar", size: 15, height: 1.5,),
                            SmallText(text: "Untung lebih banyak sebagai member!", size: 10 , height: 1.5),
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
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top:5, right: 20, left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 20,
                    crossAxisCount: 5 ,
                    children: List.generate(15,(index){
                      return Container(
                          child: IconTextBottom(icon: iconMainMenu[index], text: titleIconMainMenu[index],)
                      );
                    }),
                  ),
                ),
                SizedBox(height: 30,),
                BigText(text: "Hotel keren untuk bobok cantik",),
                SizedBox(height: 10,),
                SmallText(text: "Tidur makin pules dan mimpi indah"),
                HotelSectionView(),
                SizedBox(height: 10,),
                BigText(text: "Kamu pasti menyukai ini",),
                SizedBox(height: 10,),
                SmallText(text: "Banjir cashback dan info menarik!"),
                SizedBox(height: 20,),
                PromoSectionView(),
              ],
            ),
        ),
      ),
      drawer: Drawer(
        width: 350,
        child: MyDrawer(),
      ),
    );
  }
}



