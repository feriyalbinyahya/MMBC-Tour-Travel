import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../../models/invoice/invoice_model.dart';
import '../../routes/route_helper.dart';

import '../../utils/colors.dart';

class InvoiceList extends StatefulWidget {
  final InvoiceModel data;
  InvoiceList(this.data);

  @override
  _InvoiceListState createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {

  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  Widget build(BuildContext context) {
    String totalBayar = widget.data.ppobTotalbayar!;
    List<String> listData = widget.data.cetakStruk();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text("Cetak Struk", style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listData.length,
              itemBuilder: (c, i) {
                return SizedBox(
                  height: 30,
                  child: ListTile(
                    title: Text(
                      listData[i].toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Total Bayar : Rp. "+totalBayar,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      listData.add(totalBayar);
                      Get.toNamed(RouteHelper.printInvoice, arguments: listData);
                    },
                    icon: Icon(Icons.print),
                    label: Text('Print'),
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}