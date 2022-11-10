import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/data/api/api_client.dart';
import 'package:mmbc_tour_and_travel/data/repository/auth/auth_repo.dart';
import 'package:mmbc_tour_and_travel/data/repository/homepage/recommended_hotel_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/auth/auth_controller.dart';
import '../controllers/homepage/recommended_hotel_controller.dart';
import '../controllers/homepage/recommended_promo_controller.dart';
import '../data/repository/homepage/recommended_promo_repo.dart';
import '../utils/app_constans.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => RecommendedHotelRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedPromoRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => RecommendedHotelController(recommendedHotelRepo: Get.find()));
  Get.lazyPut(() => RecommendedPromoController(recommendedPromoRepo: Get.find()));
}