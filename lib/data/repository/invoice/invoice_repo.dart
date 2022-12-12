


import 'package:dio/dio.dart';

import '../../../utils/app_constans.dart';
import '../../api/api_client2.dart';

class InvoiceRepo {
  final ApiClient2 apiClient;
  InvoiceRepo({
    required this.apiClient,
  });

  Future<Response<dynamic>>sendInvoice2(String username, String password, String invoice, String nomorPelanggan) async {
    var dio = Dio();
    FormData formData = FormData.fromMap({"username": username, "password": password, "invoice": invoice, "ppob_nomorpelanggan": nomorPelanggan});
    var url = AppConstants.BASE_URL2+AppConstants.INVOICE_URI;
    var response = await dio.post(url, data: formData);
    return response;
  }
}