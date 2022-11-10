
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/data/repository/homepage/recommended_promo_repo.dart';

import '../../models/recommended_promo_model.dart';

class RecommendedPromoController extends GetxController {
  final RecommendedPromoRepo recommendedPromoRepo;

  RecommendedPromoController({required this.recommendedPromoRepo});
  List<Promo> _recommendedPromoList=[];
  List<Promo> get recommendedPromoList => _recommendedPromoList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedPromoList() async {
    Response response = await recommendedPromoRepo.getRecommendedPromoList();

    if(response.statusCode == 200){
      _recommendedPromoList = [];
      List<dynamic> it = jsonDecode(response.body);

      for(var item in it){
        Promo promo = Promo.fromJson(item);
        _recommendedPromoList.add(promo);
      }
      _isLoaded = true;
      update();
    }
  }
}