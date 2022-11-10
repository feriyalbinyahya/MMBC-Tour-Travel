import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:mmbc_tour_and_travel/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_constans.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({
    required this.apiClient, required this.sharedPreferences
  });

  bool _isLoadingLogout = false;
  bool get isLoadingLogout => _isLoadingLogout;

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email": email, "password": password});
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async{
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try{
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    }catch(e){
      throw e;
    }
  }

  bool clearSharedData(){
    _isLoadingLogout = true;
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PHONE);
    sharedPreferences.remove(AppConstants.PASSWORD);
    apiClient.token='';
    apiClient.updateHeader('');
    _isLoadingLogout = false;
    return true;
  }
}