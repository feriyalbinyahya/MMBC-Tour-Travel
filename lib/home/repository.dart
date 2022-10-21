import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../entities/hotel.dart';
import '../entities/promo.dart';

class RepositoryHome {
  List<Hotel> _hotels = [];
  List<Promo> _promo = [];

  Future getData() async {
    try {
      var urlHotel = Uri.parse('https://mocki.io/v1/c66b236b-3568-4acf-86b6-1b146ff9d0c3');
      var urlPromo = Uri.parse('https://mocki.io/v1/8067c0e9-a614-4136-b775-c32fada95749');
      final response = await Future.wait([
        http.get(urlHotel),
        http.get(urlPromo)
      ]);

      if(response[0].statusCode == 200){
        Iterable it = jsonDecode(response[0].body);
        List<Hotel> hotels = it.map((e) => Hotel.fromJson(e)).toList();
        _hotels.addAll(hotels);
      }

      if(response[1].statusCode == 200) {
        Iterable it = jsonDecode(response[1].body);
        List<Promo> promo = it.map((e) => Promo.fromJson(e)).toList();
        _promo.addAll(promo);
      }
      return;

    }catch(e){
      print(e.toString());
    }
  }

  Future getHotelData() async {
    return _hotels;
  }

  Future getPromoData() async {
    return _promo;
  }
}