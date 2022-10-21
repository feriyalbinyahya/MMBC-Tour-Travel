import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mmbc_tour_and_travel/home/repository.dart';

import '../entities/hotel.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class HotelSectionView extends StatefulWidget {
  const HotelSectionView({Key? key}) : super(key: key);

  @override
  State<HotelSectionView> createState() => _HotelSectionViewState();
}

class _HotelSectionViewState extends State<HotelSectionView> {
  List<Hotel> _hotels = [];
  RepositoryHome repo = RepositoryHome();

  getData() async {
    repo.getData();
    _hotels = await repo.getHotelData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.only(left:5, right: 5, top: 20),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16/9,
              enlargeCenterPage: false,
              viewportFraction: 0.85,
            ),
            itemCount: (_hotels.length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first + 1;
              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    flex: 1,
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: _buildPageItem(_hotels[idx])
                    ),
                  );
                }).toList(),
              );
            },
          ),
    );
  }
  Widget _buildPageItem(Hotel hotel){
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
