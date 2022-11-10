
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/data/repository/homepage/recommended_hotel_repo.dart';

import '../../models/recommended_hotel_model.dart';

class RecommendedHotelController extends GetxController {
  final RecommendedHotelRepo recommendedHotelRepo;

  RecommendedHotelController({required this.recommendedHotelRepo});
  List<RecommendedHotel> _recommendedHotelList=[];
  List<RecommendedHotel> get recommendedHotelList => _recommendedHotelList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedHotelList() async {
    Response response = await recommendedHotelRepo.getRecommendedHotelList();

    if(response.statusCode == 200){
      _recommendedHotelList = [];
      List<dynamic> it = jsonDecode(response.body);

      for(var item in it){
        RecommendedHotel hotel = RecommendedHotel.fromJson(item);
        _recommendedHotelList.add(hotel);
      }
      _isLoaded = true;
      update();
    }
  }
}