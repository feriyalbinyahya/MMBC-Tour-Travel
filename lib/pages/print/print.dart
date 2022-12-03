import 'package:blue_thermal_printer/blue_thermal_printer.dart' as blue_thermal;
import 'package:bluetooth_print/bluetooth_print_model.dart' as bluetooth_model;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/colors.dart';

class PrintPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  PrintPage(this.data);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  blue_thermal.BlueThermalPrinter printer = blue_thermal.BlueThermalPrinter.instance;
  List<blue_thermal.BluetoothDevice> _devices = [];
  String _devicesMsg = "";
  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  void initState() {
    super.initState();
    getDevices();
  }

  void getDevices() async {
    _devices = await printer.getBondedDevices();
    print(_devices);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text("Pilih Printer", style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
          ),
        ),
      ),
      body: _devices.isEmpty
          ? Center(
        child: Text(_devicesMsg ?? ''),
      )
          : ListView.builder(
        itemCount: _devices.length,
        itemBuilder: (c, i) {
          return ListTile(
            leading: Icon(Icons.print),
            title: Text(_devices[i].name.toString()),
            subtitle: Text(_devices[i].address.toString()),
            onTap: () {
              _startPrint(_devices[i]);
            },
          );
        },
      ),
    );
  }

  Future<void> _startPrint(blue_thermal.BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await printer.connect(device);

      Map<String, dynamic> config = Map();
      List<bluetooth_model.LineText> list = [];

      list.add(
        bluetooth_model.LineText(
          type: bluetooth_model.LineText.TYPE_TEXT,
          content: "Grocery App",
          weight: 2,
          width: 2,
          height: 2,
          align: bluetooth_model.LineText.ALIGN_CENTER,
          linefeed: 1,
        ),
      );

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          bluetooth_model.LineText(
            type: bluetooth_model.LineText.TYPE_TEXT,
            content: widget.data[i]['title'],
            weight: 0,
            align: bluetooth_model.LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );

        list.add(
          bluetooth_model.LineText(
            type: bluetooth_model.LineText.TYPE_TEXT,
            content:
            "${f.format(this.widget.data[i]['price'])} x ${this.widget.data[i]['qty']}",
            align: bluetooth_model.LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }
    }
  }
}