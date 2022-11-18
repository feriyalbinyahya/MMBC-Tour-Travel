import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/widgets/big_text.dart';
void showCustomSnackBar(String message, {bool isError=true, String title="Error"}){
  Get.snackbar(title, message,
    titleText: BigText(text: title, color: Colors.white, size: 15,),
    messageText: Text(message, style: const TextStyle(
      color: Colors.white, fontSize: 13
    )),
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.redAccent,
    borderRadius: 0,
    margin: EdgeInsets.all(0),
    padding: EdgeInsets.only(bottom: 15, top: 15, right: 20, left: 20)
  );
}