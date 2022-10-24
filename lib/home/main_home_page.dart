import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/home/promo_banner.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';
import 'package:mmbc_tour_and_travel/widgets/icon_text_bottom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mmbc_tour_and_travel/widgets/image_icon.dart';
import 'package:fine_icons/fine_icons.dart';
import 'package:mmbc_tour_and_travel/widgets/product/bus_akap_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/flight_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/isi_pulsa_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/kapal_ferry_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/kirim_paket_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/tiket_bioskop_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/transfer_uang_icon.dart';

import '../widgets/big_text.dart';
import '../widgets/dot_circle.dart';
import '../widgets/product/bus_travel_icon.dart';
import '../widgets/product/flight_class_icon.dart';
import '../widgets/product/gopay_icon.dart';
import '../widgets/product/hotel_icon.dart';
import '../widgets/product/kai_icon.dart';
import '../widgets/product/lainnya_icon.dart';
import '../widgets/product/pelni_icon.dart';
import '../widgets/product/pln_icon.dart';
import '../widgets/small_text.dart';
import 'hotel_banner.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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

    List<String> titleDrawerItems1 = ["Homepage", "Hot Promo", "Cari Tiket Cepat",
      "Tiket Bioskop", "Kirim Paket", "Topup e-Wallet", "Produk dan Jasa"];

    List<List<String>> textDrawerItems1 = [["Menu utama", "Ikon aplikasi"],
    ["Promo", "Info menarik"], ["Rute domestik", "Internasional"], ["Cinema21",
      "CGV", "IMAX", "The Premiere"], ["Reguler", "Instant", "SameDay", "Kargo"],
    ["Gopay", "ShopeePay", "LinkAja", "OVO"], ["Semua ada disini"]];

    List<String> iconDrawerItems1 = ["homepage.png", "diskon.png",
      "rute_domestik.png", "tiket.png", "kirim_paket.png",
      "dompet.png", "produk_jasa.png"];

    List<String> titleDrawerItemsSettings = ["Akun Profil", "Upgrade Akun", "Info Cashback",
      "Verifikasi Akun", "Ganti Password", "Kunci Saldo", "Kebijakan & Regulasi"];

    List<List<String>> textDrawerItemsSettings = [["Berisi data pribadi", "Virtual akun"],
      ["Status level", "Info & laporan cashback"], ["Pembagian cashback berdasarkan level"], ["Upload KTP dan selfie",
        "Video call Whatsapp"], ["Ubah password maksimal 3 bulan sekali"],
      ["Saldo lebih aman", "Proteksi dengan OTP"], ["Ketentuan dan layanan yang berlaku"]];

    List<String> iconDrawerItemsSettings = ["akun_profil.png", "upgrade.png",
      "cashback.png", "verifikasi.png", "ganti_password.png",
      "kunci_saldo.png", "kebijakan.png"];

    PageController pageController = PageController(viewportFraction: 0.3);

    final drawerHeader = SizedBox(
      height: 130,
      child: DrawerHeader(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(color: Color(0xFFe9e9e9)),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: FlutterLogo(size: 42.0,),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Feriyal Bin Yahya", style: TextStyle(height: 1.5),),
                    SmallText(text: "feriyalbinyahya@gmail.com", color: Color(0xFF3a75a1),),
                    SmallText(text: "089661156025", color: Color(0xFF3a75a1),),
                    SmallText(text: "Status Mitra", color: Color(0xFF3a75a1),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    final drawerItems = ListView(
      children: <Widget>[drawerHeader,...List.generate(titleDrawerItems1.length, (index) =>
          ListTile(
            title: Container(
                margin: EdgeInsets.only(top: 10),
                child: _tileContent(titleDrawerItems1[index], textDrawerItems1[index])
            ),
            leading: Image(image: AssetImage("assets/images/"+iconDrawerItems1[index],)
            , width: 30, height: 30),
            onTap: () {
              Navigator.pop(context);
            },
          ),),
        SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFE8E8E8)
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
            child: Text("Settings", style: TextStyle(fontWeight: FontWeight.w400,),
            ),
          ),
        ),
        ...List.generate(titleDrawerItemsSettings.length, (index) =>
            ListTile(
              title: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: _tileContent(titleDrawerItemsSettings[index], textDrawerItemsSettings[index])
              ),
              leading: Image(image: AssetImage("assets/images/"+iconDrawerItemsSettings[index])
              , width: 30, height: 30),
              onTap: () {
                Navigator.pop(context);
              },
            ),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text(
          "MMBC Tour & Travel",
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top:20, right: 20, left: 20, bottom: 20),
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
        child: drawerItems,
      ),
    );
  }

  Widget _tileContent(String title, List<String> listTopic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title,size: 16, color: AppColors.titleColorDark,),
        SizedBox(height: 3,),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: <Widget>[...List.generate(listTopic.length, (index) =>
          index==0?SmallText(text: listTopic[index], color: AppColors.textColor2,):
          Wrap(
            children: [
              DotCircle(color: Colors.grey, width: 3, height: 3,mtop: 5, mleft: 3, mright: 8,),
              SmallText(text: listTopic[index], color: AppColors.textColor2),
            ],
          )
          )
          ]
        ),
        const SizedBox(height: 10,),
        const Divider(
          color: Colors.grey,
          height: 1,
          thickness: 0.2,
          endIndent: 25,
        ),
      ],
    );
  }
}



