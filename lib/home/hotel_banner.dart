import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/controllers/homepage/recommended_hotel_controller.dart';

import '../models/recommended_hotel_model.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class HotelSectionView extends StatefulWidget {
  const HotelSectionView({Key? key}) : super(key: key);

  @override
  State<HotelSectionView> createState() => _HotelSectionViewState();
}

class _HotelSectionViewState extends State<HotelSectionView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedHotelController>(builder: (recommendedHotel){
      return Container(
        padding: EdgeInsets.only(left:5, right: 5, top: 20),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: 300,
            aspectRatio: 16/9,
            enlargeCenterPage: false,
            viewportFraction: 0.85,
          ),
          itemCount: (recommendedHotel.recommendedHotelList.length / 2).round(),
          itemBuilder: (context, index, realIdx) {
            final int first = index * 2;
            final int second = first + 1;
            return Row(
              children: [first, second].map((idx) {
                return Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: _buildPageItem(recommendedHotel.recommendedHotelList[idx])
                  ),
                );
              }).toList(),
            );
          },
        ),
      );
    });
  }
  Widget _buildPageItem(RecommendedHotel hotel){
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image.network(hotel.urlImg, fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if(loadingProgress == null){
                    return child;
                  }
                  return const Center(child: Text("Loading..."),);
                }),
            ),
          ),
          BigText(text: hotel.name, size: 14, height: 1.5,),
          SizedBox(height: 4,),
          Row(
            children: [
              const Icon(Icons.my_location,size: 12,),
              SmallText(text: hotel.city, size: 10, height: 1.5,),
            ],
          ),
          SmallText(text: "${hotel.classHotel} mulai dari", height: 1.5,),
          BigText(text: hotel.price, size: 14, height: 1.5,)
        ],
      ),
    );
  }
}
