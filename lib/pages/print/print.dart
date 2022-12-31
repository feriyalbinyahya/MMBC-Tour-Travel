
import 'package:bluetooth_enable_fork/bluetooth_enable_fork.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart' as bluemodel;
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:bluetooth_thermal_printer/bluetooth_thermal_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
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
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getBluetooth() async {
    isSearching = true;
    final List? bluetooths = await BluetoothThermalPrinter.getBluetooths;
    print("Print $bluetooths");
    setState(() {
      availableBluetoothDevices = bluetooths!;
    });
    isSearching = false;
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

  Future<void> printTicket() async {
    String? isConnected = await BluetoothThermalPrinter.connectionStatus;
    if (isConnected == "true") {
      List<int> bytes = await getTicket();
      final result = await BluetoothThermalPrinter.writeBytes(bytes);
      print("Print $result");
    } else {
      //Hadnle Not Connected Senario
    }
  }

  Future<List<int>> getTicket() async {
    List<int> bytes = [];
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    bytes += generator.text("MMBC TOUR TRAVEL",
        styles: PosStyles(
          align: PosAlign.center,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
        linesAfter: 1);

    /**
    bytes += generator.text(
        "18th Main Road, 2nd Phase, J. P. Nagar, Bengaluru, Karnataka 560078",
        styles: PosStyles(align: PosAlign.center));
    bytes += generator.text('Tel: +919591708470',
        styles: PosStyles(align: PosAlign.center));
        **/

    for( var i = 0 ; i<widget.data.length; i++ ) {
      bytes += generator.text(widget.data[i],
          styles: PosStyles(align: PosAlign.center), linesAfter: 1);
    }
    bytes += generator.cut();
    return bytes;
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
            body: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: isSearching?CircularProgressIndicator():ListView.builder(
                      itemCount: availableBluetoothDevices.length > 0
                          ? availableBluetoothDevices.length
                          : 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            String select = availableBluetoothDevices[index];
                            List list = select.split("#");
                            // String name = list[0];
                            String mac = list[1];
                            this.setConnect(mac);
                          },
                          title: Text('${availableBluetoothDevices[index]}'),
                          subtitle: Text("Click to connect"),
                        );
                      },
                    )
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: connected ? this.printTicket : null,
                    child: Text("Print Ticket"),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.search),
              onPressed: () {
                this.getBluetooth();
              }
              )
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