import 'dart:convert';

import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/data/repository/auth/auth_repo.dart';

import '../../models/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
  });

  bool _isLoadingLogin = false;
  bool get isLoadingLogin => _isLoadingLogin;


  Future<ResponseModel> login(String email, String password) async {
    _isLoadingLogin = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if(response.statusCode==200){
      Map<String, dynamic> data = jsonDecode(response.body);
      if(data["success"]){
        authRepo.saveUserToken(data["user"]["password"]);
        responseModel = ResponseModel(true, data["user"]["password"]);
      }else{
        responseModel = ResponseModel(false, data["message"]);
      }
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoadingLogin = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn() ;
  }

  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}