import 'dart:convert';

import 'package:get/get.dart';

import '../../utils/app_constans.dart';
import 'package:http/http.dart' as http;

class ApiClient2 extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;

  ApiClient2({ required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = AppConstants.TOKEN;
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }

  void updateHeader(String token){
    _mainHeaders = {
      'Content-type':'application/json; charset=UTF-8',
      'Authorization':'Bearer $token',
    };
  }
  Future<Response> getData(String uri) async {
    try{
      Response response = await get(uri);
      return response;
    }catch(e){
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, FormData body) async {
    try{
      Response response = await post(uri, body);
      return response;
    }catch(e){
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}