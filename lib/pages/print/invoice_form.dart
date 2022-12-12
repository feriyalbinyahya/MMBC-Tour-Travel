import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mmbc_tour_and_travel/controllers/auth/auth_controller.dart';
import 'package:mmbc_tour_and_travel/controllers/invoice/invoice_controller.dart';
import 'package:mmbc_tour_and_travel/routes/route_helper.dart';
import 'package:mmbc_tour_and_travel/widgets/big_text.dart';
import 'package:mmbc_tour_and_travel/widgets/product/top_menu_icon.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../base/show_custom_snackbar.dart';
import '../../utils/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';

class InvoiceFormPage extends StatefulWidget {
  const InvoiceFormPage({Key? key}) : super(key: key);

  @override
  State<InvoiceFormPage> createState() => _InvoiceFormPageState();
}

class _InvoiceFormPageState extends State<InvoiceFormPage> {
  var invoiceNumberController = TextEditingController();
  var customerNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitCircle(
      color: AppColors.mainColor,
      size: 50.0,
    );
    void _sendInvoice(InvoiceController invoiceController){
      String invoiceNumber = invoiceNumberController.text.trim();
      String customerNumber = customerNumberController.text.trim();

      if(invoiceNumber.isEmpty){
        showCustomSnackBar("Masukkan nomor invoice Anda", title: "Nomor Invoice");
      }else if(!GetUtils.isPhoneNumber(invoiceNumber)){
        showCustomSnackBar("Masukkan nomor invoice yang valid", title: "Valid nomor invoice");
      }else if(customerNumber.isEmpty) {
        showCustomSnackBar("Masukkan nomor pelanggan Anda", title: "Nomor pelanggan");
      }else if(!GetUtils.isPhoneNumber(customerNumber)){
        showCustomSnackBar("Masukkan nomor pelanggan yang valid", title: "Valid nomor pelanggan");
      }else{
        invoiceController.sendInvoice("dummy", "dummy123", invoiceNumber, customerNumber).then((status){
          if(status.result == "ok"){
            showCustomSnackBar("Berhasil", isError: false, title: "Invoice");
            print(status.ppobNamapelanggan);
            Get.toNamed(RouteHelper.invoiceList, arguments: status);
          }else{
            showCustomSnackBar("Data tidak ditemukan!");
          }
        });
      }
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: MyAppBar(titlePage: "Cetak Struk"),
      ),
      body: GetBuilder<InvoiceController>(builder: (invoiceController){
        return !invoiceController.isLoadingInvoice? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: BigText(text: "Cetak Struk"),
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
                      TextField(
                        style: GoogleFonts.openSans(textStyle: TextStyle(
                            fontSize: 14
                        )),
                        controller: invoiceNumberController,
                        decoration: InputDecoration(
                          labelText: "Nomor Invoice",
                          prefixIcon: Icon(Icons.article, color: AppColors.mainColor,),

                        ),
                      ),
                      SizedBox(height: 30,),
                      TextField(
                        style: GoogleFonts.openSans(textStyle: TextStyle(
                            fontSize: 14
                        )),
                        controller: customerNumberController,
                        decoration: InputDecoration(
                          labelText: "Nomor Pelanggan",
                          prefixIcon: Icon(Icons.account_box, color: AppColors.mainColor,),
                        ),
                      ),
                      SizedBox(height: 20,),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          _sendInvoice(invoiceController);
                        },
                        child: Container(
                          width: 350,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: AppColors.mainColor
                          ),
                          child: Center(
                            child: BigText(text: "KIRIM", color: Colors.white, size: 13, weight: FontWeight.bold,),
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
        ): spinkit;
      }),
    );
  }
}
