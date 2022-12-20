import 'dart:convert';
import 'package:get/get.dart';
import 'package:mmbc_tour_and_travel/models/invoice/bpjs_kesehatan.dart';
import 'package:mmbc_tour_and_travel/models/invoice/halo_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/mcf_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/mnc_vision_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/pdam_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/pgn_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/pln_bulanan_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/pln_non_taglis_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/pln_token_model.dart';
import 'package:mmbc_tour_and_travel/models/invoice/telkom_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dioo;

import '../../data/repository/invoice/invoice_repo.dart';
import '../../models/invoice/invoice_model.dart';

class InvoiceController extends GetxController implements GetxService {
  final InvoiceRepo invoiceRepo;
  InvoiceController({
    required this.invoiceRepo
  });

  bool _isLoadingInvoice = false;
  bool get isLoadingInvoice => _isLoadingInvoice;


  Future<InvoiceModel> sendInvoice(String username, String password, String invoice, String nomorPelanggan) async {
    _isLoadingInvoice = true;
    update();
    dioo.Response<dynamic> response = await invoiceRepo.sendInvoice2(username, password, invoice, nomorPelanggan);
    if(response.statusCode==200){
      print(".......SUCCESS......");
      print(response.data);
      Map<String, dynamic> data = response.data;
      if(data["result"] == "ok"){
        print("masuk ok");
        String produk = data["ppob_produk"];
        _isLoadingInvoice = false;
        update();
        switch(produk){
          case "PLN Pra Bayar":{
            return PLNToken.fromJson(data);
          }
          case "PLN": {
            return PLNBulanan.fromJson(data);

          }
          case "PLNNONTAGLIS": {
            return PLNNonTaglis.fromJson(data);

          }
          case "BPJS Kesehatan":{
            return BPJSKesehatan.fromJson(data);

          }
          case "TELKOM": {
            return Telkom.fromJson(data);

          }
          case "PDAM ATB Batam":{
            return PDAM.fromJson(data);

          }
          case "MNCVISION":{
            return MNCVision.fromJson(data);

          }
          case "HALO":{
            return HALO.fromJson(data);

          }
          case "PGN": {
            return PGN.fromJson(data);
          }
          case "MCF":{
            return MCF.fromJson(data);
          }
        }
        return PLNToken();
      }
      else{
        _isLoadingInvoice = false;
        update();
        return PLNToken();
      }
    }else{
      _isLoadingInvoice = false;
      update();
      return PLNToken();
    }
  }
}