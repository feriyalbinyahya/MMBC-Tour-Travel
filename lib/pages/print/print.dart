
import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart' as bluemodel;
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_blue_plugin/flutter_blue_plugin.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';

import '../../base/show_custom_snackbar.dart';
import '../../utils/colors.dart';

class PrintPage extends StatefulWidget {
  final List<String> data;
  PrintPage(this.data);

  @override
  _PrintPageState createState() => _PrintPageState();
}

class _PrintPageState extends State<PrintPage> {
  bool connected = false;
  List availableBluetoothDevices = [];
  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  void initState() {
    super.initState();
  }

  Future<void> getBluetooth() async {
    final List? bluetooths = await BluetoothThermalPrinter.getBluetooths;
    print("Print $bluetooths");
    setState(() {
      availableBluetoothDevices = bluetooths!;
    });
  }

  Future<void> setConnect(String mac) async {
    final String? result = await BluetoothThermalPrinter.connect(mac);
    print("state conneected $result");
    if (result == "true") {
      setState(() {
        connected = true;
      });
    }
  }


  Future<void> enableBT() async {
    BluetoothEnable.enableBluetooth.then((value) {
      if(value == "false"){
        showCustomSnackBar("Tidak dapat mencetak struk", title: "Bluetooth tidak aktif");
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
              (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
      stream: FlutterBlue.instance.state,
      initialData: BluetoothState.unknown,
      builder: (c, snapshot){
        final state = snapshot.data;
        if(state == BluetoothState.on){
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(55),
              child: AppBar(
                backgroundColor: AppColors.mainColor,
                title: Text("Pilih Printer", style: GoogleFonts.openSans(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () => printer.startScan(timeout: Duration(seconds: 4)),
              child: SingleChildScrollView(
                child: StreamBuilder<List<bluemodel.BluetoothDevice>>(
                    stream: printer.scanResults,
                    initialData: [],
                    builder: (c, snapshot) {
                      if(snapshot.data?.length == 0){
                        return Column(
                            children: [
                              SizedBox(height: 50,),
                              Center(child: Text("No devices found")),
                            ]);
                      }
                      print(snapshot.data);
                      return Column(
                        children: snapshot.data!.map((d) => ListTile(
                          leading: Icon(Icons.print),
                          title: Text(d.name.toString()),
                          subtitle: Text(d.address.toString()),
                          onTap: () {
                            _startPrint(d);
                          },
                        )).toList(),
                      );
                    }
                ),
              ),
            ),
            floatingActionButton: StreamBuilder<bool>(
              stream: printer.isScanning,
              initialData: false,
              builder: (c, snapshot) {
                if (snapshot.data == true) {
                  return FloatingActionButton(
                    child: Icon(Icons.stop),
                    onPressed: () => printer.stopScan(),
                    backgroundColor: Colors.red,
                  );
                } else {
                  return FloatingActionButton(
                      child: Icon(Icons.search),
                      onPressed: () => printer.startScan(timeout: Duration(seconds: 4)));
                }
              },
            ),
          );
        }else{
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.bluetooth_disabled,
                  size: 200.0,
                  color: Colors.white54,
                ),
                Text(
                  'Bluetooth is ${state != null ? state.toString().substring(15) : 'not available'}.',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subtitle2
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (() {
                    enableBT();
                  }),
                  child: Text('Request to turn on Bluetooth'),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (() {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()), // this mymainpage is your page to refresh
                          (Route<dynamic> route) => false,
                    );
                  }),
                  child: Text('Kembali ke Beranda'),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<void> _startPrint(bluemodel.BluetoothDevice device) async {
    if (device != null && device.address != null) {
      await printer.connect(device);

      Map<String, dynamic> config = Map();
      List<LineText> list = [];

      list.add(
        LineText(
          type: LineText.TYPE_TEXT,
          content: "MMBC TOUR TRAVEL",
          weight: 2,
          width: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,
          linefeed: 1,
        ),
      );

      for (var i = 0; i < widget.data.length; i++) {
        list.add(
          LineText(
            type: LineText.TYPE_TEXT,
            content: widget.data[i],
            weight: 0,
            align: LineText.ALIGN_LEFT,
            linefeed: 1,
          ),
        );
      }
    }
  }
}

/**
 *
 * ListView.builder(
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
 */