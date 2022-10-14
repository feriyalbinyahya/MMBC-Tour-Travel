import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/utils/colors.dart';
import 'package:mmbc_tour_and_travel/widgets/icon_text_bottom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mmbc_tour_and_travel/widgets/image_icon.dart';
import 'package:fine_icons/fine_icons.dart';
import 'package:mmbc_tour_and_travel/widgets/product/flight_icon.dart';
import 'package:mmbc_tour_and_travel/widgets/product/kapal_ferry_icon.dart';

import '../widgets/big_text.dart';
import '../widgets/dot_circle.dart';
import '../widgets/product/bus_travel_icon.dart';
import '../widgets/product/flight_class_icon.dart';
import '../widgets/product/hotel_icon.dart';
import '../widgets/product/kai_icon.dart';
import '../widgets/product/pelni_icon.dart';
import '../widgets/small_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    List<String> imgListHotel = ["https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg"];

    List<String> hotelNameList = ["Hotel Santika BSD", "Hotel Salak The Heritage",
    "Hotel Marina Airport", "Horison Ultima Bekasi", "Hotel Banjarmasin",
    "Avissa Suites"];

    List<String> cityHotelList = ["Jakarta", "Bogor", "Semarang", "Bekasi", "Banjarmasin",
    "Jakarta Selatan"];

    List<String> classHotelList = ["Deluxe Twin", "Deluxe", "Deluxe Only Room", "Deluxe",
    "Deluxe Double Room Only", "Deluxe Queen Bed"];

    List<String> priceHotelList = ["681.889", "550.989", "215.000", "644.887", "290.000",
    "589.999"];

    List<Widget> iconMainMenu = [FlightIcon(), FlightClassIcon(),
    KAIIcon(), HotelIcon(), PELNIIcon(),
    KapalFerryIcon(), BusTravelIcon(), FlightIcon(), FlightIcon(),
    FlightIcon(), FlightIcon(), FlightIcon(), FlightIcon(),
    FlightIcon(), FlightIcon()];

    List<String> titleIconMainMenu = ["Flight", "Flight Class", "Kereta Api",
      "Hotel", "PELNI", "Kapal Ferry", "Bus Travel", "Bus AKAP", "PLN", "GOPAY",
      "Isi Pulsa", "Transfer Uang", "Tiket Bioskop", "Kirim Paket", "Lainnya"];

    List<String> titleDrawerItems1 = ["Homepage", "Hot Promo", "Cari Tiket Cepat",
      "Tiket Bioskop", "Kirim Paket", "Topup e-Wallet", "Produk dan Jasa"];

    List<List<String>> textDrawerItems1 = [["Menu utama", "Ikon aplikasi"],
    ["Promo", "Info menarik"], ["Rute domestik", "Internasional"], ["Cinema21",
      "CGV", "IMAX", "The Premiere"], ["Reguler", "Instant", "SameDay", "Kargo"],
    ["Gopay", "ShopeePay", "LinkAja", "OVO"], ["Semua ada disini"]];

    List<String> iconDrawerItems1 = ["home-48.png", "price-tag-50.png",
      "airport-white.png", "clapperboard-white.png", "kurir-white.png",
      "coin-wallet-60.png", "circled-menu-50.png"];

    List<Color> colorIconDrawerItems1 = [Color(0xFF31C6E6), Color(0xFF35BBAB), Color(0xFFC289DB),
    Color(0xFFF37C9C), Color(0xFF85B5F5), Color(0xFF4AB69E), Color(0xFF83B3F1)];

    List<String> titleDrawerItemsSettings = ["Akun Profil", "Upgrade Akun", "Info Cashback",
      "Verifikasi Akun", "Ganti Password", "Kunci Saldo", "Kebijakan & Regulasi"];

    List<List<String>> textDrawerItemsSettings = [["Berisi data pribadi", "Virtual akun"],
      ["Status level", "Info & laporan cashback"], ["Pembagian cashback berdasarkan level"], ["Upload KTP dan selfie",
        "Video call Whatsapp"], ["Ubah password maksimal 3 bulan sekali"],
      ["Saldo lebih aman", "Proteksi dengan OTP"], ["Ketentuan dan layanan yang berlaku"]];

    List<Icon> iconDrawerItemsSettings = [Icon(Icons.person_off), Icon(Icons.upgrade),
      Icon(Icons.attach_money), Icon(Icons.fingerprint), Icon(Icons.password),
      Icon(Icons.shield), Icon(Icons.dangerous)];

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
                margin: EdgeInsets.only(top: 5),
                child: _tileContent(titleDrawerItems1[index], textDrawerItems1[index])
            ),
            leading: IconImage(color: colorIconDrawerItems1[index],
              pathImage: "assets/images/"+iconDrawerItems1[index],
            ),
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
              leading: iconDrawerItemsSettings[index],
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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
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
            Flexible(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left:5, right: 5, top: 20),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16/9,
                      enlargeCenterPage: false,
                      viewportFraction: 0.85,
                    ),
                    itemCount: (imgListHotel.length / 2).round(),
                    itemBuilder: (context, index, realIdx) {
                      final int first = index * 2;
                      final int second = first + 1;
                      return Row(
                        children: [first, second].map((idx) {
                          return Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: _buildPageItem(imgListHotel[idx], hotelNameList[idx],
                              cityHotelList[idx], classHotelList[idx], priceHotelList[idx])
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        width: 350,
        child: drawerItems,
      ),
    );
  }

  Widget _buildPageItem(String image, String hotelName, String city, String classHotel,
      String price){
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(image, fit: BoxFit.cover),
          BigText(text: hotelName, size: 14, height: 1.5,),
          Row(
            children: [
              const Icon(Icons.my_location,size: 12,),
              SmallText(text: city, size: 10, height: 1.5,),
            ],
          ),
          SmallText(text: classHotel + " mulai dari", height: 1.5,),
          BigText(text: price, size: 14, height: 1.5,)
        ],
      ),
    );
  }

  Widget _tileContent(String title, List<String> listTopic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title,size: 16, color: AppColors.titleColorDark,),
        SizedBox(height: 5,),
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
        const SizedBox(height: 13,),
        const Divider(
          color: Colors.grey,
          height: 5,
          thickness: 0.2,
          endIndent: 25,
        ),
      ],
    );
  }
}



