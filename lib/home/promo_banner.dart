import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mmbc_tour_and_travel/home/repository.dart';

import '../entities/promo.dart';

class PromoSectionView extends StatefulWidget {
  const PromoSectionView({Key? key}) : super(key: key);

  @override
  State<PromoSectionView> createState() => _PromoSectionViewState();
}

class _PromoSectionViewState extends State<PromoSectionView> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> itemPromoBanner = [];

  List<Promo> _promo = [];
  RepositoryHome repo = RepositoryHome();

  getData() async {
    repo.getData();
    _promo = await repo.getPromoData();
  }

  @override
  void initState() {
    for (Promo item in _promo) {
      var banner = InkWell(
        onTap: (){},
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.network(item.urlImg, fit: BoxFit.cover,),
        ),
      );
      itemPromoBanner.add(banner);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          items: itemPromoBanner,
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: itemPromoBanner.asMap().entries.map((entry) {
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
  }
}
