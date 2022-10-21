import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/data/api/api_client.dart';
import 'package:mmbc_tour_and_travel/data/repository/homepage/recommended_hotel_repo.dart';

import '../controllers/homepage/recommended_hotel_controller.dart';
import '../utils/app_constans.dart';

Future<void> init() async{
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => RecommendedHotelRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => RecommendedHotelController(recommendedHotelRepo: Get.find()));
}