import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/controllers/auth/auth_controller.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../pages/home/main_home_page.dart';
import '../utils/colors.dart';
import 'big_text.dart';
import 'dot_circle.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isPressedProductDrawer = false;

  List<bool> isPressedProduct = [false, false, false, false,
    false, false, false, false, false, false,
    false, false, false, false, false, false,
    false, false, false, false, false];

  List<List<String>> productMenu = [["Cari Tiket Cepat", "Booking Tiket", "International Flights",
  "Ticketing Queue", "Manage Ticket", "Manage Ticket (Old)", "Web Check-In", "Booking Group",
  "Refund", "Reschedule", "Laporan Bonus"], ["Booking Ticket", "Laporan Transaksi", "Laporan Bonus"],
    ["Booking Ticket", "Ticketing Queue", "Manage Ticket"], ["Booking Hotel", "Ticketing Queue", "Manage Ticket"],
    ["Bus AKAP", "Bus Travel", "Bus Pariwisata", "Ticketing Queue", "Manage Ticket"], ["Booking Ticket", "Ticketing Queue",
    "Manage Ticket", "Laporan Bonus"], ["Booking Ticket", "Ticketing Queue", "Manage Ticket", "Laporan Bonus"],
    ["Pulsa Indonesia", "Paket Data Indonesia", "Paket Telepon Indonesia", "Tukar Pulsa Jadi Uang", "Pulsa Malaysia",
    "Harga Pulsa, Internet & Telepon", "Harga Pulsa, Internet & Telepon (API/H2H)"], ["PLN Bulanan", "Token PLN",
    "PLN Non Taglis", "TELKOM/SPEEDY", "PDAM", "BPJS Kesehatan", "Kartu Pascabayar", "Internet/TV Kabel",
    "Tagihan Leasing", "PGN", "Tagihan Kartu Kredit", "Angsuran Kredit", "Premi Asuransi", "Pajak Kendaraan",
    "Home Credit", "KREDIVO", "Pajak Daerah (PBB)", "Biaya Pendidikan (SPP)", "PPOB Malaysia", "PPOB Terjadwal",
    "Daftar Harga PPOB"], ["GOPAY", "GOPAY Driver", "OVO", "GrabPay Konsumen", "LinkAja", "DANA", "ShopeePay",
    "e-Money Mandiri", "BRIZZI"], ["Web Travel", "Aplikasi Android", "Ganti Template Web"], [], [], [], [], [],
    [], [], [], ["Wisata Dunia", "WaterBoom", "Tiket Dufan", "Moto GP"], []];
  @override
  Widget build(BuildContext context) {

    List<String> titleDrawerItems1 = ["Homepage", "Hot Promo", "Cari Tiket Cepat",
      "Tiket Bioskop", "Kirim Paket", "Topup e-Wallet"];

    List<List<String>> textDrawerItems1 = [["Menu utama", "Ikon aplikasi"],
      ["Promo", "Info menarik"], ["Rute domestik", "Internasional"], ["Cinema21",
        "CGV", "IMAX", "The Premiere"], ["Reguler", "Instant", "SameDay", "Kargo"],
      ["Gopay", "ShopeePay", "LinkAja", "OVO"]];

    List<String> iconDrawerItems1 = ["homepage.png", "diskon.png",
      "rute_domestik.png", "tiket.png", "kirim_paket.png",
      "dompet.png"];

    List<String> titleDrawerItemsSettings = ["Akun Profil", "Upgrade Akun", "Info Cashback",
      "Verifikasi Akun", "Ganti Password", "Kunci Saldo", "Kebijakan & Regulasi"];

    List<List<String>> textDrawerItemsSettings = [["Berisi data pribadi", "Virtual akun"],
      ["Status level", "Info & laporan cashback"], ["Pembagian cashback berdasarkan level"], ["Upload KTP dan selfie",
        "Video call Whatsapp"], ["Ubah password maksimal 3 bulan sekali"],
      ["Saldo lebih aman", "Proteksi dengan OTP"], ["Ketentuan dan layanan yang berlaku"]];

    List<String> iconDrawerItemsSettings = ["akun_profil.png", "upgrade.png",
      "cashback.png", "verifikasi.png", "ganti_password.png",
      "kunci_saldo.png", "kebijakan.png"];

    List<String> titleDrawerProduct = ["Pesawat", "Kereta (KAI)", "KTM Malaysia", "Hotel",
    "Bus", "PELNI", "Kapal Ferry", "Pulsa, Internet & Telepon", "Tagihan & Angsuran", "Topup e-Wallet",
    "Website & Apps", "Voucher Game", "Transfer Uang", "Kirim Uang", "MMBC Express", "Tiket Bioskop",
    "Umroh", "Toko MMBC", "MMBC Asuransi", "Tiket Rekreasi", "Paket Tour"];

    List<IconData> iconDrawerProduct = [Icons.airplanemode_active, Icons.directions_train, Icons.directions_train,
    Icons.bed, Icons.directions_bus, Icons.directions_boat, Icons.directions_boat, Icons.signal_cellular_alt,
    Icons.text_snippet, Icons.account_balance_wallet, Icons.web, Icons.videogame_asset, Icons.money, Icons.money,
    Icons.fire_truck, Icons.tv, Icons.wallet_travel, Icons.shopping_bag, Icons.shield, Icons.map_outlined,
    Icons.settings_input_antenna];

    final drawerHeader = GetBuilder<AuthController>(builder: (authController) {
      return SizedBox(
        height: authController.userLoggedIn()?130:110,
        child: DrawerHeader(
          padding: EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(color: Color(0xFFf4f4f4)),
          child: Container(
            child: authController.userLoggedIn()?Row(
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
                      Text("Feriyal Bin Yahya", style: TextStyle(height: 1.5, color: Color(0xff7e8992)),),
                      SizedBox(height: 3,),
                      SmallText(text: "feriyalbinyahya@gmail.com", color: Color(0xFFa3b4c1),),
                      SmallText(text: "089661156025", color: Color(0xFFa3b4c1),),
                      RichText(
                        text: TextSpan(
                            text: "Status",
                            style: GoogleFonts.openSans(textStyle: TextStyle(color: Color(0xFFa3b4c1), fontSize: 12)),
                            children: [
                              TextSpan(
                                  text: " Mitra",
                                  style: GoogleFonts.openSans(textStyle: TextStyle(color: Color(0xff577991), fontSize: 12, fontWeight: FontWeight.bold))
                              )
                            ]
                        ),
                      )
                    ],
                  ),
                )
              ],
            ):Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.login);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff0086be),
                    radius: 25,
                    child: Icon(
                      Icons.person,
                      color: Color(0xffF4f4f4),
                      size: 35,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hai,", style: TextStyle(height: 1.5, color: Color(0xff7e8992)),),
                        SizedBox(height: 3,),
                        SmallText(text: "Kamu belum Login!", color: Color(0xff7e8992),),
                        SmallText(text: "klik disini untuk login", color: Color(0xFF68afb7),),
                      ],
                    ),
                    onTap: (){
                      Get.toNamed(RouteHelper.login);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
    return GetBuilder<AuthController>(builder: (authController) {
      return ListView(
        children: <Widget>[drawerHeader,...List.generate(titleDrawerItems1.length, (index) =>
            ListTile(
              title: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: _tileContent(titleDrawerItems1[index], textDrawerItems1[index])
              ),
              minLeadingWidth : 10,
              leading: Container(
                child: Image(image: AssetImage("assets/images/"+iconDrawerItems1[index],)
                    , width: 25, height: 25),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),),
          ListTile(
            trailing: isPressedProductDrawer?Icon(Icons.arrow_left_rounded):Icon(Icons.arrow_right_rounded),
            title: Container(
                margin: EdgeInsets.only(top: 8),
                child: _tileContent("Produk", ["Produk jasa"])
            ),
            minLeadingWidth : 10,
            leading: Container(
              child: Image(image: AssetImage("assets/images/produk_jasa.png",)
                  , width: 25, height: 25),
            ),
            onTap: () {
              if(!isPressedProductDrawer){
                setState(() {
                  isPressedProductDrawer = true;
                });
              }else{
                setState(() {
                  isPressedProductDrawer = false;
                });
              }
            },
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: isPressedProductDrawer?
              [...List.generate(titleDrawerProduct.length, (index) =>
                  ListTile(
                    trailing: productMenu[index].length>0?(isPressedProduct[index]?Icon(Icons.arrow_left_rounded):Icon(Icons.arrow_right_rounded)):null,
                    title: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: _tileContentProduct(titleDrawerProduct[index])
                        ),
                        Column(
                          children: isPressedProduct[index]?
                          [...List.generate(productMenu[index].length, (idx) =>
                              ListTile(
                                  title: Container(
                                    child: _tileContentProduct((productMenu[index])[idx]),
                                  ),
                                  onTap: (){}
                              )
                          )]:[],
                        )
                      ],
                    ),
                    minLeadingWidth : 10,
                    leading: Icon(iconDrawerProduct[index], color: Color(0xff707070),),
                    onTap: () {
                      if(productMenu[index].length>0){
                        if(!isPressedProduct[index]){
                          setState(() {
                            //agar cuma satu button tile yang dropdown list nya
                            for(int i=0; i<isPressedProduct.length; i++){
                              isPressedProduct[i] = false;
                            }
                            isPressedProduct[index] = true;
                          });
                        }else{
                          setState(() {
                            isPressedProduct[index] = false;
                          });
                        }
                      }
                    },
                  ),
              ),
              ]
                  :[],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFF6F6F6)
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 30, top: 8, bottom: 8),
              child: Text("Settings", style: TextStyle(fontWeight: FontWeight.w400, color: Color(0xff626262)),
              ),
            ),
          ),
          SizedBox(height: 8,),
          ...List.generate(titleDrawerItemsSettings.length, (index) =>
              ListTile(
                title: Container(
                    margin: EdgeInsets.only(top: 8),
                    child: _tileContent(titleDrawerItemsSettings[index], textDrawerItemsSettings[index])
                ),
                minLeadingWidth : 10,
                leading: Container(
                  child: Image(image: AssetImage("assets/images/"+iconDrawerItemsSettings[index])
                      , width: 25, height: 25),
                ),
                onTap: () {

                },
              ),
          ),
          Container(
              child: authController.userLoggedIn()?Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListTile(
                      leading: Icon(Icons.power_settings_new, color: Color(0xff668ca8),),
                      title: Container(
                        child: BigText(text: "LOGOUT", color: Color(0xff668ca8), size: 13, weight: FontWeight.bold,),
                      ),
                      minLeadingWidth : 10,
                      onTap: (){
                        Get.find<AuthController>().clearSharedData();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
                              (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ),
                  Flexible(
                      child: GestureDetector(
                        onTap: (){},
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xff668ca8),
                              style: BorderStyle.solid,
                              width: 1.0,
                            ),
                          ),
                          child: Icon(Icons.question_mark, size: 16, color: Color(0xff668ca8),),
                        ),
                      )
                  )
                ],
              ):Container()
          )
        ],
      );
    },);
  }
  Widget _tileContent(String title, List<String> listTopic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title,size: 15, color: Color(0xff404040),),
        SizedBox(height: 3,),
        Wrap(
            spacing: 5,
            runSpacing: 5,
            children: <Widget>[...List.generate(listTopic.length, (index) =>
            index==0?SmallText(text: listTopic[index], color: Color(0xff8f8f8f), weight: FontWeight.w400, size: 11,):
            Wrap(
              children: [
                DotCircle(color: Colors.grey, width: 3, height: 3,mtop: 5, mleft: 3, mright: 8,),
                SmallText(text: listTopic[index], color: Color(0xff8f8f8f), weight: FontWeight.w400, size: 11,),
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

  Widget _tileContentProduct(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: title,size: 12, color: AppColors.titleColorDark,),
        SizedBox(height: 3,),
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

  void _showLoading() async {
    SmartDialog.showLoading();
    await Future.delayed(Duration(seconds: 2));
    SmartDialog.dismiss();
  }
}
