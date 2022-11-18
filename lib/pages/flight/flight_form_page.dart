import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/widgets/small_text.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:date_field/date_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../utils/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/big_text.dart';
class FlightFormPage extends StatefulWidget {
  const FlightFormPage({Key? key}) : super(key: key);

  @override
  State<FlightFormPage> createState() => _FlightFormPageState();
}

class _FlightFormPageState extends State<FlightFormPage> {
  var lokasiAsalController = TextEditingController();
  var lokasiTujuanController = TextEditingController();
  bool statusPulangPergi = false;
  final List<String> dewasaItems = [
    '1 dewasa', '2 dewasa', '3 dewasa', '4 dewasa', '5 dewasa',
    '6 dewasa', '7 dewasa',];
  final List<String> anakItems = [
    '0 anak', '1 anak', '2 anak', '3 anak', '4 anak', '5 anak',
    '6 anak', '7 anak',];
  final List<String> bayitems = [
    '0 bayi', '1 bayi', '2 bayi', '3 bayi',];

  String? selectedValueDewasa;
  String? selectedValueAnak;
  String? selectedValueBayi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MyAppBar(titlePage: "Flight"),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: BigText(text: "Booking Pesawat"),
                    padding: EdgeInsets.only(left: 20, top: 20),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(top: 10, left: 35, right: 35, bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                        width: 380,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Color(0xfff2f6f9),
                        ),
                        child: RichText(text: TextSpan(text: "",
                          style: TextStyle(
                            height: 1.5,
                              fontSize: 12,
                              color: Color(0xff435870)
                          ),
                          children: [
                            WidgetSpan(child: Icon(Icons.info, size: 16,)),
                            TextSpan(text: " Penumpang berusia minimal 18 tahun yang telah vaksin dosis ke-1 dan ke-2 ", style: TextStyle(fontSize: 11)),
                            TextSpan(
                              text: "tidak diperkenankan",
                              style: TextStyle(height: 1.5, fontSize: 11, fontWeight: FontWeight.w800),
                            ),
                            TextSpan(
                              style: TextStyle(height: 1.5, fontSize: 11,),
                                text: " melakukan perjalanan domestik, untuk yang sudah vaksin dosis ke-3 (booster) diperbolehkan melakukan perjalanan domestik dan tidak wajib menunjukan hasil tes COVID-19."
                            ),
                            ]
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.gps_fixed, color: Color(0xff01a3cc), size: 16,),
                          SizedBox(width: 4,),
                          SmallText(text: "Kota / Bandara Asal")
                        ],
                      ),
                      SizedBox(
                        child: TextField(
                          style: GoogleFonts.openSans(textStyle: TextStyle(
                              fontSize: 14
                          )),
                          controller: lokasiAsalController,
                          decoration: InputDecoration(

                          ),
                        ),
                        height: 35,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.room, color: Color(0xffeb6250), size: 16,),
                          SizedBox(width: 4,),
                          SmallText(text: "Kota / Bandara Tujuan")
                        ],
                      ),
                      SizedBox(
                        child: TextField(
                          style: GoogleFonts.openSans(textStyle: TextStyle(
                              fontSize: 14
                          )),
                          controller: lokasiTujuanController,
                          decoration: InputDecoration(
                          ),
                        ),
                        height: 35,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_month, color: AppColors.titleColorDark, size: 16,),
                              SizedBox(width: 4,),
                              SmallText(text: "Tanggal pergi"),
                            ],
                          ),
                          SmallText(text: "Pulang pergi?", size: 11,)
                        ],
                      ),
                      SizedBox(
                        child: Stack(
                          children: [
                            DateTimeFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),

                              ),
                              mode: DateTimeFieldPickerMode.date,
                              autovalidateMode: AutovalidateMode.always,
                              validator: (DateTime? e) {
                                return (e?.day ?? 0) == 1
                                    ? 'Please not the first day'
                                    : null;
                              },
                              onDateSelected: (DateTime value) {
                                print(value);
                              },
                            ),
                            Positioned(
                              right: 13,
                              bottom: 13,
                              child: FlutterSwitch(
                                width: 45.0,
                                height: 18.0,
                                valueFontSize: 12.0,
                                toggleSize: 18.0,
                                value: statusPulangPergi,
                                onToggle: (val) {
                                  setState(() {
                                    statusPulangPergi = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        height: 40,
                      ),
                      Container(
                        child: statusPulangPergi?Column(
                          children: [
                            SizedBox(height: 20,),
                            Row(
                              children: [
                                Icon(Icons.calendar_month, color: AppColors.titleColorDark, size: 16,),
                                SizedBox(width: 4,),
                                SmallText(text: "Tanggal pulang"),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              child: DateTimeFormField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle: TextStyle(color: Colors.redAccent),

                                ),
                                mode: DateTimeFieldPickerMode.date,
                                autovalidateMode: AutovalidateMode.always,
                                validator: (DateTime? e) {
                                  return (e?.day ?? 0) == 1
                                      ? 'Please not the first day'
                                      : null;
                                },
                                onDateSelected: (DateTime value) {
                                  print(value);
                                },
                              ),
                            ),
                          ],
                        ):null,
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Wrap(
                            spacing: 10,
                            direction: Axis.vertical,
                            children: [
                              SmallText(text: "Dewasa"),
                              Flexible(
                                child: SizedBox(
                                  height: 35,
                                  width: 80,
                                  child: DropdownButtonFormField2(
                                    dropdownMaxHeight: 150,
                                    dropdownWidth: 80,
                                    decoration: InputDecoration(
                                      //Add isDense true and zero Padding.
                                      //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(left: 5),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      //Add more decoration as you want here
                                      //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                    ),
                                    isExpanded: true,
                                    hint: Text(
                                      dewasaItems[0],
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 15,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(left: 5, right: 5),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    itemHeight: 35,
                                    offset: Offset(-5, 0),
                                    scrollbarAlwaysShow: true,
                                    dropdownPadding: EdgeInsets.only(top: 3, bottom: 3),
                                    items: dewasaItems
                                        .map((item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                        ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select the amount.';
                                      }
                                    },
                                    onChanged: (value) {
                                      //Do something when changing the item if you want.
                                    },
                                    onSaved: (value) {
                                      selectedValueDewasa = value.toString();
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                        },
                        child: Container(
                          width: 350,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: AppColors.mainColor
                          ),
                          child: Center(
                            child: BigText(text: "Cari Jadwal", color: Colors.white, size: 13, weight: FontWeight.bold,),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ],
            ),
          ),
      )
    );
  }
}
