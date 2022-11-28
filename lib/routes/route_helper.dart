import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/pages/account/take_picture.dart';
import 'package:mmbc_tour_and_travel/pages/account/test_page.dart';
import 'package:mmbc_tour_and_travel/pages/flight/flight_form_page.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';

class RouteHelper {
  static const String initial = "/";
  static const String signup = "/signup";
  static const String login = "/login";
  static const String flightForm = "/flight";
  static const String takepicture = '/takepicture';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> MainPage()),
    GetPage(name: login, page: () {
      return LoginPage();
    },
      transition: Transition.noTransition
    ),
    GetPage(name: flightForm, page: ()=> FlightFormPage()),
    GetPage(name: takepicture, page: ()=> TakePicture()),
  ];
}