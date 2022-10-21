import 'package:get/get.dart';

import '../../../utils/app_constans.dart';
import '../../api/api_client.dart';

class RecommendedHotelRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedHotelRepo({required this.apiClient});

  Future<Response> getRecommendedHotelList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_HOTEL_URI);
  }
}