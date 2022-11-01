
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mmbc_tour_and_travel/controllers/homepage/recommended_promo_controller.dart';
import 'package:get/get.dart';

import '../../models/recommended_promo_model.dart';

class PromoSectionView extends StatefulWidget {
  const PromoSectionView({Key? key}) : super(key: key);

  @override
  State<PromoSectionView> createState() => _PromoSectionViewState();
}

class _PromoSectionViewState extends State<PromoSectionView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedPromoController>(builder: (recommendedPromo){
      return Container(
        child: Column(children: [
          CarouselSlider.builder(
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            itemCount: recommendedPromo.recommendedPromoList.length,
            itemBuilder: (context, index, realIdx) {
              return recommendedPromo.isLoaded?_buildContent(recommendedPromo.recommendedPromoList[index]):const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: recommendedPromo.recommendedPromoList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 7.0,
                  height: 7.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
        ]),
      );
    });
  }

  Widget _buildContent(Promo promo){
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(promo.urlImg, fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if(loadingProgress == null){
                return child;
              }
              return const Center(child: Text("Loading..."),);
            }),
      ),
    );
  }
}
