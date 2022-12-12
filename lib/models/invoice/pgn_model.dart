import 'package:mmbc_tour_and_travel/models/invoice/invoice_model.dart';

class PGN extends InvoiceModel{
  String? ppobBulantagihan;
  String? ppobMetertagihan;

  PGN(
      {
        this.ppobBulantagihan,
        this.ppobMetertagihan,});

  PGN.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    ppobInvoice = json['ppob_invoice'];
    ppobProduk = json['ppob_produk'];
    ppobKodeproduk = json['ppob_kodeproduk'];
    ppobTanggal = json['ppob_tanggal'];
    ppobNomorpelanggan = json['ppob_nomorpelanggan'];
    ppobNamapelanggan = json['ppob_namapelanggan'];
    ppobBulantagihan = json['ppob_bulantagihan'];
    ppobMetertagihan = json['ppob_metertagihan'];
    ppobTotaltagihan = json['ppob_totaltagihan'];
    ppobAdmin = json['ppob_admin'];
    ppobTotalbayar = json['ppob_totalbayar'];
    ppobDebet = json['ppob_debet'];
    ppobKodeagen = json['ppob_kodeagen'];
    ppobStatus = json['ppob_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['ppob_invoice'] = this.ppobInvoice;
    data['ppob_produk'] = this.ppobProduk;
    data['ppob_kodeproduk'] = this.ppobKodeproduk;
    data['ppob_tanggal'] = this.ppobTanggal;
    data['ppob_nomorpelanggan'] = this.ppobNomorpelanggan;
    data['ppob_namapelanggan'] = this.ppobNamapelanggan;
    data['ppob_bulantagihan'] = this.ppobBulantagihan;
    data['ppob_metertagihan'] = this.ppobMetertagihan;
    data['ppob_totaltagihan'] = this.ppobTotaltagihan;
    data['ppob_admin'] = this.ppobAdmin;
    data['ppob_totalbayar'] = this.ppobTotalbayar;
    data['ppob_debet'] = this.ppobDebet;
    data['ppob_kodeagen'] = this.ppobKodeagen;
    data['ppob_status'] = this.ppobStatus;
    return data;
  }

  @override
  List<String> cetakStruk() {
    // TODO: implement cetakStruk
    throw UnimplementedError();
  }
}