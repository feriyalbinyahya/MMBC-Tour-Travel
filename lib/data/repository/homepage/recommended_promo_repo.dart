import 'package:get/get.dart';

import '../../../utils/app_constans.dart';
import '../../api/api_client.dart';

class RecommendedPromoRepo extends GetxService {
  final ApiClient apiClient;

  RecommendedPromoRepo({required this.apiClient});

  Future<Response> getRecommendedPromoList() async {
    return await apiClient.getData(AppConstants.RECOMMENDED_PROMO_URI);
  }
}