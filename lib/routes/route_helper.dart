import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/pages/account/take_picture.dart';
import 'package:mmbc_tour_and_travel/pages/account/test_page.dart';
import 'package:mmbc_tour_and_travel/pages/biometric_pin/passcod.dart';
import 'package:mmbc_tour_and_travel/pages/biometric_pin/setup_pincode.dart';
import 'package:mmbc_tour_and_travel/pages/flight/flight_form_page.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';
import 'package:mmbc_tour_and_travel/pages/print/invoice_form.dart';
import 'package:mmbc_tour_and_travel/pages/print/invoice_list.dart';
import 'package:mmbc_tour_and_travel/pages/print/print.dart';

import '../models/invoice/invoice_model.dart';

class RouteHelper {
  static const String initial = "/";
  static const String signup = "/signup";
  static const String login = "/login";
  static const String flightForm = "/flight";
  static const String takepicture = '/takepicture';
  static const String invoiceList = '/invoice-list';
  static const String printInvoice = '/print-invoice';
  static const String invoiceForm = '/invoice-form';
  static const String passcode = '/passcode';
  static const String setupPinCode = '/setup-pincode';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> MainPage()),
    GetPage(name: login, page: () {
      return LoginPage();
    },
      transition: Transition.noTransition
    ),
    GetPage(name: flightForm, page: ()=> FlightFormPage()),
    GetPage(name: takepicture, page: ()=> TakePicture()),
    GetPage(name: printInvoice, page: () {
      List<String> _pickData=Get.arguments;
      return PrintPage(_pickData);
    }),
    GetPage(name: invoiceForm, page: ()=> InvoiceFormPage()),
    GetPage(name: setupPinCode, page: ()=> SetupPincode()),
    GetPage(name: passcode, page: () {
      bool _pickData=Get.arguments;
      return PasscodePage(_pickData);
    }),
    GetPage(name: invoiceList, page: () {
      InvoiceModel _pickData=Get.arguments;
      return InvoiceList(_pickData);
    }),
  ];
}