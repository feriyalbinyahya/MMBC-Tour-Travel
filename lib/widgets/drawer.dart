import 'package:flutter/material.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';

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
    return ListView(
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
        ListTile(
          trailing: isPressedProductDrawer?Icon(Icons.arrow_left_rounded):Icon(Icons.arrow_right_rounded),
          title: Container(
              margin: EdgeInsets.only(top: 10),
              child: _tileContent("Produk", ["Produk jasa"])
          ),
          leading: Image(image: AssetImage("assets/images/produk_jasa.png",)
              , width: 30, height: 30),
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
        Column(
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
        SizedBox(height: 10,),
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

              },
            ),
        )
      ],
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
            index==0?SmallText(text: listTopic[index], color: AppColors.textColor2, weight: FontWeight.w400, size: 11,):
            Wrap(
              children: [
                DotCircle(color: Colors.grey, width: 3, height: 3,mtop: 5, mleft: 3, mright: 8,),
                SmallText(text: listTopic[index], color: AppColors.textColor2, weight: FontWeight.w400, size: 11,),
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
        BigText(text: title,size: 16, color: AppColors.titleColorDark,),
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
}
