import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/pages/home/main_home_page.dart';
import 'package:mmbc_tour_and_travel/pages/login/login.dart';

class RouteHelper {
  static const String initial = "/";
  static const String signup = "/signup";
  static const String login = "/login";

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=> MainPage()),
    GetPage(name: login, page: () {
      return LoginPage();
    },
      transition: Transition.noTransition
    ),
  ];
}