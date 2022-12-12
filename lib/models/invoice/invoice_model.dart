abstract class InvoiceModel {
  String? result;
  String? ppobInvoice;
  String? ppobProduk;
  String? ppobKodeproduk;
  String? ppobTanggal;
  String? ppobNomorpelanggan;
  String? ppobNamapelanggan;
  String? ppobTotaltagihan;
  String? ppobAdmin;
  String? ppobTotalbayar;
  String? ppobBulantagihan;
  String? ppobReff;
  String? ppobDebet;
  String? ppobKodeagen;
  String? ppobStatus;

  InvoiceModel();

  List<String> cetakStruk();
}